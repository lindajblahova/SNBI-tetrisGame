classdef Board
    %BOARD Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        board
        fallingTetromino
        generator
        positionLeft
        positionUp
    end
    
    methods
        function obj = Board()
            obj.board = zeros(20,10);
            obj.generator = Generator();
        end

        function obj = addTetrominoToBoard(obj)
            obj.fallingTetromino = obj.generator.generateTetromino();

            upTetrominoBorder = obj.fallingTetromino.getUpPosition();
            startingRow = upTetrominoBorder(1);
            colInMatrix = 3;

            for row = 1:size(obj.fallingTetromino.matrix) - startingRow + 1
                for col = 1:size(obj.fallingTetromino.matrix)
                    obj.board(row,colInMatrix+col) = obj.fallingTetromino.matrix(startingRow,col);
                end
                startingRow = startingRow + 1;
            end
        end

        function obj = moveTetrominoLeft(obj)
            %BOARD Construct an instance of this class
            %   Detailed explanation goes here
            obj.board = zeros(20,10);
        end
         
        function obj = moveTetrominoRight(obj)
            %BOARD Construct an instance of this class
            %   Detailed explanation goes here
            obj.board = zeros(20,10);
        end
    end
end

