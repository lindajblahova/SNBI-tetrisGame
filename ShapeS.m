classdef ShapeS < Tetromino
    %SHAPES Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeS()
            obj@Tetromino();
            obj.matrix(2,2) = 1;
            obj.matrix(2,3) = 1;
            obj.matrix(3,2) = 1;
            obj.matrix(3,1) = 1;
        end
        
    end
end

