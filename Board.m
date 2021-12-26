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
            obj.fallingTetromino = Tetromino();
            obj.positionLeft = 0;
            obj.positionUp = 0;
        end

        function obj = addTetrominoToBoard(obj, tetromino, rowIndex, colIndex)
            if (obj.positionLeft ~= 0 && obj.positionUp ~= 0)
                obj.removeTetrominoFromBoard();
            end
            
            obj.fallingTetromino = tetromino;
            %upTetrominoBorder = obj.fallingTetromino.getUpPosition();
            %startingRow = upTetrominoBorder(1);

            for row = 1:size(obj.fallingTetromino.matrix) 
                for col = 1:size(obj.fallingTetromino.matrix) 
                    obj.board(rowIndex + row - 1,colIndex + col - 1) = obj.fallingTetromino.matrix(row,col);
                end
            end
            obj.positionLeft = colIndex;
            obj.positionUp = rowIndex; 
        end

        function obj = removeTetrominoFromBoard(obj)
            for row = 1:size(obj.fallingTetromino.matrix) 
                for col = 1:size(obj.fallingTetromino.matrix) 
                    obj.board(obj.positionUp + row - 1,obj.positionLeft + col - 1) = 0;
                end
            end
        end

        function obj = moveTetromino(obj, direction)
            obj = obj.removeTetrominoFromBoard();
            moved = false;

            if (direction == "left")
                if (obj.positionLeft > 1)
                     obj.positionLeft = obj.positionLeft - 1;
                elseif (obj.positionLeft == 1)
                    [obj.fallingTetromino, moved] = obj.fallingTetromino.moveWithinMatrix(direction, moved);
                end
            elseif (direction == "right")
                if (obj.positionLeft+size(obj.fallingTetromino.matrix) < 10)
                     obj.positionLeft = obj.positionLeft + 1;
                elseif (obj.positionLeft+size(obj.fallingTetromino.matrix) == 10)
                    [obj.fallingTetromino, moved] = obj.fallingTetromino.moveWithinMatrix(direction, moved);
                end
            elseif (direction == "down")
                if (obj.positionUp+size(obj.fallingTetromino.matrix) < 20)
                    obj.positionUp = obj.positionUp + 1;
                elseif (obj.positionUp+size(obj.fallingTetromino.matrix) == 20)
                    [obj.fallingTetromino, moved] = obj.fallingTetromino.moveWithinMatrix(direction, moved);
                end
                 
            end

            obj = obj.addTetrominoToBoard(obj.fallingTetromino, obj.positionUp, obj.positionLeft);
        end

    end
end

