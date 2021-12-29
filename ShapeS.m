classdef ShapeS < Tetromino
    %SHAPES Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeS()
            obj@Tetromino();
            obj.matrix(2,2) = 5;
            obj.matrix(2,3) = 5;
            obj.matrix(3,2) = 5;
            obj.matrix(3,1) = 5;

            obj.value = 15;
        end
        
    end
end

