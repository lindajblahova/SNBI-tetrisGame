classdef ShapeJ < Tetromino
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = ShapeJ()
            obj@Tetromino();
            obj.matrix(1,3) = 2;
            obj.matrix(2,3) = 2;
            obj.matrix(3,3) = 2;
            obj.matrix(4,3) = 2;
            obj.matrix(4,2) = 2;
        end
        
    end
end

