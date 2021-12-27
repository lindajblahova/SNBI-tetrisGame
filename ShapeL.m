classdef ShapeL < Tetromino
    %SHAPEL Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeL()
            obj@Tetromino();
            obj.matrix(1,2) = 3;
            obj.matrix(2,2) = 3;
            obj.matrix(3,2) = 3;
            obj.matrix(4,2) = 3;
            obj.matrix(4,3) = 3;
        end

    end
end

