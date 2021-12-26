classdef ShapeT < Tetromino
    %SHAPET Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeT()
            obj@Tetromino();
            obj.matrix(2,2) = 1;
            obj.matrix(2,3) = 1;
            obj.matrix(2,4) = 1;
            obj.matrix(3,3) = 1;
        end
        
    end
end

