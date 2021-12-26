classdef Generator
    %GENERATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = Generator()
        end
        
        function tetromino = generateTetromino(obj)
            switch randi(7,1)
                case 1
                    tetromino = ShapeI();
                case 2
                    tetromino = ShapeJ();
                case 3
                    tetromino = ShapeL();
                case 4
                    tetromino = ShapeO();
                case 5
                    tetromino = ShapeS();
                case 6
                    tetromino = ShapeT();
                case 7
                    tetromino = ShapeZ();
                otherwise
            end
        end
    end
end

