classdef ShapeT < Tetromino
    %SHAPET Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeT()
            obj@Tetromino();
            obj.matrix(2,2) = 6;
            obj.matrix(2,3) = 6;
            obj.matrix(2,4) = 6;
            obj.matrix(3,3) = 6;
        end
        
    end
end

