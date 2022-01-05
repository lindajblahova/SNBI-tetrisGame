classdef Tetromino
    %OBJECT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        matrix
        value
    end
    
    methods
        function obj = Tetromino()
            obj.matrix = zeros(4);
        end

        function obj = rotateRight(obj)
            newMatrix = [
                obj.matrix(4,1) obj.matrix(3,1) obj.matrix(2,1) obj.matrix(1,1) ;
                obj.matrix(4,2) obj.matrix(3,2) obj.matrix(2,2) obj.matrix(1,2) ;
                obj.matrix(4,3) obj.matrix(3,3) obj.matrix(2,3) obj.matrix(1,3) ;
                obj.matrix(4,4) obj.matrix(3,4) obj.matrix(2,4) obj.matrix(1,4)
                ];
            obj.matrix = newMatrix;
        end

        function leftBorderPosition = getLeftPosition(obj)  
            leftBorderPosition = [0 0];
            for col = 1:size(obj.matrix)
                for row = size(obj.matrix):-1:1
                    if (obj.matrix(row,col) ~= 0)
                        leftBorderPosition = [row col];
                        break;
                    end
                end
                if (leftBorderPosition(1) ~= 0 &&  leftBorderPosition(2) ~= 0)
                    break;
                end
            end
        end

        function rightBorderPosition = getRightPosition(obj)
            rightBorderPosition = [0 0];
            for col = size(obj.matrix):-1:1
                for row = size(obj.matrix):-1:1
                    if (obj.matrix(row,col) ~= 0)
                        rightBorderPosition = [row col];
                        break;
                    end
                end
                if (rightBorderPosition(1) ~= 0 && rightBorderPosition(2) ~= 0)
                    break;
                end
            end
        end

        function downBorderPosition = getDownPosition(obj)
            downBorderPosition = [0 0];
            for row = size(obj.matrix):-1:1
                for col = size(obj.matrix):-1:1
                    if (obj.matrix(row,col) ~= 0)
                        downBorderPosition = [row col];
                        break;
                    end
                end
                if (downBorderPosition(1) ~= 0 && downBorderPosition(2) ~= 0)
                    break;
                end
            end
        end

        function downBlocks = getAllDownBlocks(obj, downBlocks)
            for row = size(obj.matrix):-1:1
                for col = size(obj.matrix):-1:1
                    if (obj.matrix(row,col) ~= 0)
                        if (row == 4 || ( row ~= 4 && obj.matrix(row+1,col) == 0))
                        downBlocks = [downBlocks ; row col];
                        end
                    end
                end
            end
        end

        function leftBlocks = getAllLeftBlocks(obj, leftBlocks)
            for row = size(obj.matrix):-1:1
                for col = 1:size(obj.matrix)
                    if (obj.matrix(row,col) ~= 0)
                        if (col == 1 || (col ~= 1 && obj.matrix(row,col - 1) == 0))
                        leftBlocks = [leftBlocks ; row col];
                        end
                    end
                end
            end
        end

        function rightBlocks = getAllRightBlocks(obj, rightBlocks)
            for row = size(obj.matrix):-1:1
                for col = size(obj.matrix):-1:1
                    if (obj.matrix(row,col) ~= 0)
                        if (col == 4 || (col ~= 4 && obj.matrix(row,col + 1) == 0))
                        rightBlocks = [rightBlocks ; row col];
                        end
                    end
                end
            end
        end

         function upBorderPosition = getUpPosition(obj)  
            upBorderPosition = [0 0];
            for row = 1:size(obj.matrix)
                for col = 1:size(obj.matrix)
                    if (obj.matrix(row,col) ~= 0)
                        upBorderPosition = [row col];
                        break;
                    end
                end
                if (upBorderPosition(1) ~= 0 && upBorderPosition(2) ~= 0)
                    break;
                end
            end
        end

        function [obj, isDown] = moveWithinMatrix(obj, direction, isDown)
            switch direction
                case "left"
                    leftVector = obj.getLeftPosition();
                    if (leftVector(2) > 1)
                        newMatrix = [
                            obj.matrix(:,2) obj.matrix(:,3) obj.matrix(:,4) obj.matrix(:,1) 
                        ];
                        obj.matrix = newMatrix;
                    end
                case "right"
                    rightVector = obj.getRightPosition();
                    if (rightVector(2) < 4)
                        newMatrix = [
                            obj.matrix(:,4) obj.matrix(:,1) obj.matrix(:,2) obj.matrix(:,3) 
                        ];
                        obj.matrix = newMatrix;
                    end
                case "down"
                    downVector = obj.getDownPosition();
                    disp(downVector);
                    disp(obj.matrix);
                    if (downVector(1) < 4)
                        newMatrix = [
                            obj.matrix(4,:) ;
                            obj.matrix(1,:) ;
                            obj.matrix(2,:) ;
                            obj.matrix(3,:) 
                        ];
                        obj.matrix = newMatrix;
                        downVector = obj.getDownPosition();
                        if (downVector(1) < 4)
                            isDown = false;
                        else
                            isDown = true;
                        end
                    elseif (downVector(1) == 4)
                        isDown = true;
                    end
                otherwise
            end
        end

    end
end

