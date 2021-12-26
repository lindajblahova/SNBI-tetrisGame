classdef ShapeO < Tetromino
    %SHAPEO Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeO()
            obj@Tetromino();
            obj.matrix(2,2) = 1;
            obj.matrix(2,3) = 1;
            obj.matrix(3,2) = 1;
            obj.matrix(3,3) = 1;
        end

    end
end

