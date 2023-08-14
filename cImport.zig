const std = @import("std");
const c = @cImport({
    @cInclude("windows.h");
});

pub fn main() void {
    const className = "ZigWindowClass";
    const windowName = "Zig Window";

    const wc = c.WNDCLASSW{
        .style = c.CS_HREDRAW | c.CS_VREDRAW,
        .lpfnWndProc = std.convert.Uintptr(WindowProc),
        .hInstance = c.GetModuleHandleA(null),
        .hIcon = null,
        .hCursor = c.LoadCursorA(null, c.IDC_ARROW),
        .hbrBackground = c.COLOR_WINDOW,
        .lpszClassName = className,
    };

    c.RegisterClassW(&wc);

    const hwnd = c.CreateWindowExW(
        0,
        className,
        windowName,
        c.WS_OVERLAPPEDWINDOW,
        c.CW_USEDEFAULT,
        c.CW_USEDEFAULT,
        c.CW_USEDEFAULT,
        c.CW_USEDEFAULT,
        null,
        null,
        c.GetModuleHandleA(null),
        null,
    );

    if (hwnd == null) |err| {
        _ = err;
        _ = c.MessageBoxA(null, "Window creation failed", "Error", c.MB_ICONERROR);
        return;
    }

    c.ShowWindow(hwnd, c.SW_SHOWDEFAULT);
    c.UpdateWindow(hwnd);

    const msg = c.MSG{};
    while (c.GetMessageA(&msg, null, 0, 0)) |_| {
        c.TranslateMessage(&msg);
        c.DispatchMessageA(&msg);
    }
}

pub fn WindowProc(hwnd: c.HWND, msg: c.UINT, wParam: c.WPARAM, lParam: c.LPARAM) c.LRESULT {
    switch (msg) {
        // Handle messages here
        c.WM_DESTROY => {
            c.PostQuitMessage(0);
            return 0;
        },
        _ => return c.DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}
