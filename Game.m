classdef Game
    %GAME Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        board
        play
        fileText
    end
    
    methods
        function obj = Game()
            obj.board = Board();
            obj.play = true;
            obj.fileText = "";
        end
        
        function obj = moveOnKeyPress(obj, value)

            % 28 leftarrow
            % 29 rightarrow
            % 30 uparrow
            % 31 downarrow

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

        function obj = moveDown(obj)
                    obj.board = obj.board.moveTetromino("down");
        end

        function obj = stopGame(obj)
                    obj.play = false;
        end

        function obj = playGame(obj)
            obj = obj.readHighScore();
            set(gcf,'Visible','on');
            spy(obj.board.boardMatrix, 'k');
            set(gcf,'currentch',char(1));
            value = 0;
            while obj.play
            
                value = double(get(gcf,'CurrentCharacter'));
                
                switch value
                    case 28
                        obj = obj.moveOnKeyPress(value);
                    case 29
                        obj = obj.moveOnKeyPress(value);
                    case 30
                        obj = obj.moveOnKeyPress(value);
                    case 31
                        obj = obj.moveOnKeyPress(value);
                    case 32
                        pause;
                        figure(1);
                    case 1
                    otherwise
                        obj.play = false;
                end
                
                spy(obj.board.boardMatrix, 'k');
                hold on
                spy(obj.board.boardMatrix==1,'r');
                spy(obj.board.boardMatrix==2,'g');
                spy(obj.board.boardMatrix==3,'b');
                spy(obj.board.boardMatrix==4,'c');
                spy(obj.board.boardMatrix==5,'m');
                spy(obj.board.boardMatrix==6,'y');
                spy(obj.board.boardMatrix==7,'k');
                xlabel(strcat('Skore: ', "" + obj.board.score + "." + obj.fileText));
                hold off
                
                obj = obj.moveDown();
            
                set(gcf,'currentch',char(1));
                
                pause(0.5);
                figure(1);
                
            end

            highscore = str2double(split(obj.fileText));
            disp(highscore);
            if (highscore(3) < obj.board.score)
                obj = obj.writeHighScore();
            end
        end

        function obj = readHighScore(obj)
            f_file = fopen("highscore.txt","r");
            obj.fileText =  fgetl(f_file);
            fclose(f_file);
        end

        function obj = writeHighScore(obj)
            f_file = fopen("highscore.txt","w");
            fprintf(f_file,"Najvyssie skore: %d Dosiahnute: %s\n", obj.board.score, datestr(now,'dd.mm.yyyy HH:MM'));
            fclose(f_file);
        end

    end
end

