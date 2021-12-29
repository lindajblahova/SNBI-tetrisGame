classdef ShapeZ < Tetromino
    %SHAPEZ Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeZ()
            obj@Tetromino();
            obj.matrix(2,2) = 7;
            obj.matrix(2,3) = 7;
            obj.matrix(3,3) = 7;
            obj.matrix(3,4) = 7;

            obj.value = 15;
        end
        
    end
end

