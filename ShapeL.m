classdef ShapeL < Tetromino
    %SHAPEL Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeL()
            obj@Tetromino();
            obj.matrix(1,2) = 1;
            obj.matrix(2,2) = 1;
            obj.matrix(3,2) = 1;
            obj.matrix(4,2) = 1;
            obj.matrix(4,3) = 1;
        end

    end
end

