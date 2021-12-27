classdef ShapeO < Tetromino
    %SHAPEO Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeO()
            obj@Tetromino();
            obj.matrix(2,2) = 4;
            obj.matrix(2,3) = 4;
            obj.matrix(3,2) = 4;
            obj.matrix(3,3) = 4;
        end

    end
end

