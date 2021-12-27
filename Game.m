classdef Game
    %GAME Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        board
    end
    
    methods
        function obj = Game()
            obj.board = Board();
        end
        
        function obj = moveOnKeyPress(obj)
            k = waitforbuttonpress;
            % 28 leftarrow
            % 29 rightarrow
            % 30 uparrow
            % 31 downarrow
            value = double(get(gcf,'CurrentCharacter'));

            switch value
                case 28
                    obj.board = obj.board.moveTetromino("left");
                case 29
                    obj.board = obj.board.moveTetromino("right");
                case 30
                    obj.board = obj.board.rotateTetrominoInBoard();
                case 31
                    obj.board = obj.board.moveTetromino("down");
                otherwise
            end
        end
    end
end

