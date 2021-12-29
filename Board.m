classdef Board
    %BOARD Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        boardMatrix
        fallingTetromino
        generator
        positionLeft
        positionUp
        score
    end
    
    methods
        function obj = Board()
            obj.boardMatrix = zeros(20,10);
            obj.generator = Generator();
            obj.positionLeft = 0;
            obj.positionUp = 0;
            obj.fallingTetromino = obj.generator.generateTetromino();
            obj = obj.addTetrominoToBoard(obj.fallingTetromino,1,3);
            obj.score = 0;
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
                    if (obj.fallingTetromino.matrix(row,col) ~= 0)
                    obj.boardMatrix(rowIndex + row - 1,colIndex + col - 1) = obj.fallingTetromino.matrix(row,col);
                    end
                end
            end
            obj.positionLeft = colIndex;
            obj.positionUp = rowIndex; 
        end

        function obj = removeTetrominoFromBoard(obj)
            for row = 1:size(obj.fallingTetromino.matrix) 
                for col = 1:size(obj.fallingTetromino.matrix) 
                    if (obj.fallingTetromino.matrix(row,col) ~= 0)
                    obj.boardMatrix(obj.positionUp + row - 1,obj.positionLeft + col - 1) = 0;
                    end
                end
            end
        end

        function obj = rotateTetrominoInBoard(obj)  
            obj = obj.removeTetrominoFromBoard();
            obj.fallingTetromino = obj.fallingTetromino.rotateRight();
            obj = obj.addTetrominoToBoard(obj.fallingTetromino, obj.positionUp, obj.positionLeft); 
        end

        function canGoDown = checkToMoveDown(obj, canGoDown) 
            downBlocks = [];
            downBlocks = obj.fallingTetromino.getAllDownBlocks(downBlocks);
            if (obj.positionUp < 17)
                for i = 1:size(downBlocks)
                    if (downBlocks(i,1) == 4 && obj.positionUp == 16)
                    break;
                    end
                    if (obj.boardMatrix(obj.positionUp + downBlocks(i,1) + 1, obj.positionLeft + downBlocks(i,2) - 1) ~= 0)
                        canGoDown = false;
                    break;
                    end
                end
           end
        end

        function canGoLeft = checkToMoveLeft(obj, canGoLeft) 
            leftBlocks = [];
            leftBlocks = obj.fallingTetromino.getAllLeftBlocks(leftBlocks);
            if (obj.positionLeft >= 1)
                for i = 1:size(leftBlocks)
                    if (leftBlocks(i,2) == 1 && obj.positionLeft == 1)
                         canGoLeft = false;
                    break;
                    end
                    if (obj.boardMatrix(obj.positionUp + leftBlocks(i,1) - 1, obj.positionLeft + leftBlocks(i,2) - 2) ~= 0)
                        canGoLeft = false;
                    break;
                    end
                end
            end     
        end

        function canGoRight = checkToMoveRight(obj, canGoRight) 
            rightBlocks = [];
            rightBlocks = obj.fallingTetromino.getAllRightBlocks(rightBlocks);
            if (obj.positionLeft + size(obj.fallingTetromino.matrix) - 1 < 10)
                for i = 1:size(rightBlocks)
                    if (rightBlocks(i,2) == 4 && (obj.positionLeft + 4 - 1 == 10))
                         canGoRight = false;
                    break;
                    end
                    if (obj.boardMatrix(obj.positionUp + rightBlocks(i,1) - 1, obj.positionLeft + rightBlocks(i,2)) ~= 0)
                        canGoRight = false;
                    break;
                    end
                end
           end
        end

        function obj = checkFullRows(obj)
            countOfFullRows = 0;
            newMatrix = obj.boardMatrix;
            for row = 1:20
                B = min(newMatrix(row,:));
                if (B > 0)
                    newMatrix(row,:) = [];
                    countOfFullRows = countOfFullRows + 1;
                end
            end

            obj.score = obj.score + (countOfFullRows*100);

            emptyRows = zeros(countOfFullRows,10);
            newMatrix = [emptyRows ; newMatrix];
            obj.boardMatrix = newMatrix;
        end

        function obj = moveTetromino(obj, direction)
            if (obj.positionLeft ~= 0 && obj.positionUp ~= 0)
                obj = obj.removeTetrominoFromBoard();
            end
            isDown = false;
            canGoDown = true;
            canGoLeft = true;
            canGoRight = true;

            if (direction == "left")

                canGoLeft = obj.checkToMoveLeft(canGoLeft);

                if (canGoLeft)
                    if (obj.positionLeft > 1)
                        obj.positionLeft = obj.positionLeft - 1;
                    elseif (obj.positionLeft == 1)
                        obj.fallingTetromino= obj.fallingTetromino.moveWithinMatrix(direction, isDown);
                    end
                end

            elseif (direction == "right")

                canGoRight = obj.checkToMoveRight(canGoRight);

                if (canGoRight)
                    if (obj.positionLeft+size(obj.fallingTetromino.matrix)-1 < 10)
                        obj.positionLeft = obj.positionLeft + 1;
                    elseif (obj.positionLeft+size(obj.fallingTetromino.matrix)-1 == 10)
                        obj.fallingTetromino = obj.fallingTetromino.moveWithinMatrix(direction, isDown);
                    end
                end
                
            elseif (direction == "down")
               
                canGoDown = obj.checkToMoveDown(canGoDown);

                if (canGoDown)
                    if (obj.positionUp+size(obj.fallingTetromino.matrix)-1 < 20)
                        obj.positionUp = obj.positionUp + 1;
                    elseif (obj.positionUp+size(obj.fallingTetromino.matrix)-1 == 20)
                        [obj.fallingTetromino, isDown] = obj.fallingTetromino.moveWithinMatrix(direction, isDown);
                        disp(isDown);
                    end
                end
                 
            end

            if (canGoDown)
                obj = obj.addTetrominoToBoard(obj.fallingTetromino, obj.positionUp, obj.positionLeft);
            end

            if ((isDown && obj.positionUp >= 17) || canGoDown == false)
                if (canGoDown == false)
                    obj = obj.addTetrominoToBoard(obj.fallingTetromino, obj.positionUp+1, obj.positionLeft);
                else
                    obj = obj.addTetrominoToBoard(obj.fallingTetromino, obj.positionUp, obj.positionLeft);
                end
               
                obj = obj.checkFullRows();
                obj.positionLeft = 0;
                obj.positionUp = 0;
                obj.score = obj.score + obj.fallingTetromino.value;
                obj.fallingTetromino = obj.generator.generateTetromino();
                obj = obj.addTetrominoToBoard(obj.fallingTetromino,1,3); 
            end
        end

    end
end

