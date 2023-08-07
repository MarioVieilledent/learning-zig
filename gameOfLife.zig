const std = @import("std");
const print = std.debug.print;

const WIDTH = 12;
const HEIGHT = 8;

const Game = struct {
    name: []const u8 = "Game of Life in Zig",
    width: u32,
    height: u32,
    matrix: [WIDTH][HEIGHT]bool,

    pub fn init() Game {
        var gameStruct = Game {
            .width = WIDTH,
            .height = HEIGHT,
            .matrix = undefined,
        };

        // for (0..WIDTH) |x| {
        //     for (0..HEIGHT) |y| {
        //         gameStruct.matrix[x][y] = false;
        //     }
        // }

        return gameStruct;
    }

    pub fn next(self: *Game) void {
        var newMatrix: [WIDTH][HEIGHT]bool = undefined;

        for (0..WIDTH) |x| {
            for (0..HEIGHT) |y| {
                var livingArround: u8 = 0;
                if (x > 0 and y > 0 and self.matrix[x - 1][y - 1]) { livingArround += 1; }
                if (x > 0 and self.matrix[x - 1][y]) { livingArround += 1; }
                if (x > 0 and y < HEIGHT - 1 and self.matrix[x - 1][y + 1]) { livingArround += 1; }
                if (y > 0 and self.matrix[x][y - 1]) { livingArround += 1; }
                if (y < HEIGHT - 1 and self.matrix[x][y + 1]) { livingArround += 1; }
                if (x < WIDTH - 1 and y > 0 and self.matrix[x + 1][y - 1]) { livingArround += 1; }
                if (x < WIDTH - 1 and self.matrix[x + 1][y]) { livingArround += 1; }
                if (x < WIDTH - 1 and y < HEIGHT - 1 and self.matrix[x + 1][y + 1]) { livingArround += 1; }

                switch (livingArround) {
                    3 => newMatrix[x][y] = true,
                    2 => if (self.matrix[x][y]) {
                        newMatrix[x][y] = true;
                    } else {
                        newMatrix[x][y] = false;
                    },
                    else => newMatrix[x][y] = false,
                }
            }
        }

        for (0..WIDTH) |x| {
            for (0..HEIGHT) |y| {
                self.matrix[x][y] = newMatrix[x][y];
            }
        }
    }

    pub fn toString(self: Game) []const u8 {
        var str: [WIDTH * HEIGHT * 2 + HEIGHT + 1]u8 = undefined;
        var counter: usize = 0;

        for (0..HEIGHT) |y| {
            for (0..WIDTH) |x| {
                if (self.matrix[x][y]) {
                    str[counter] = '<';
                    str[counter + 1] = '>';
                } else {
                    str[counter] = ' ';
                    str[counter + 1] = ' ';
                }
                counter += 2;
            }
            str[counter] = '\n';
            counter += 1;
        }
        str[counter] = '\n';

        return &str;
    }

    pub fn display(self: Game) void {
        print("{?s}\n----------------------------------\n", .{self.toString()});
    }
};

pub fn main() void {
    var game = Game.init();

    game.matrix[3][4] = true;
    game.matrix[4][4] = true;
    game.matrix[5][4] = true;
    game.matrix[5][5] = true;
    game.matrix[4][6] = true;
    game.display();

    for (0..20) |_| {
        game.next();
        std.time.sleep(std.time.ns_per_ms * 10);
        game.display();
    }

    print("6! = {}", .{fac(6)});
}

pub fn fac(n: i128) i128 { return if (n <= 1) 1 else n  * fac(n - 1); }