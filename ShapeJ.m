classdef ShapeJ < Tetromino
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeJ()
            obj@Tetromino();
            obj.matrix(1,3) = 1;
            obj.matrix(2,3) = 1;
            obj.matrix(3,3) = 1;
            obj.matrix(4,3) = 1;
            obj.matrix(4,2) = 1;
        end
        
    end
end

