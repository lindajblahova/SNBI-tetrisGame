classdef Tetromino
    %OBJECT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        matrix
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
                    if (obj.matrix(row,col) == 1)
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
                    if (obj.matrix(row,col) == 1)
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
                    if (obj.matrix(row,col) == 1)
                        downBorderPosition = [row col];
                        break;
                    end
                end
                if (downBorderPosition(1) ~= 0 && downBorderPosition(2) ~= 0)
                    break;
                end
            end
        end

         function upBorderPosition = getUpPosition(obj)
                
            upBorderPosition = [0 0];
            for row = 1:size(obj.matrix)
                for col = 1:size(obj.matrix)
                    if (obj.matrix(row,col) == 1)
                        upBorderPosition = [row col];
                        break;
                    end
                end
                if (upBorderPosition(1) ~= 0 && upBorderPosition(2) ~= 0)
                    break;
                end
            end
        end


    end
end

