function newboard = hardDifficulty(board,axes)


newboard = board;
done = false;

%% Searches the board for a 2
for i = 1:10
    for b = 1:10
        
        %% Looks for a lone hit (2)
        if board(i,b) == 2  && ~done
            
            %% First direction (down)
            if i+1 <= 10 &&  (board(i+1,b) == 1 || board(i+1,b) == 0)
                guess = board(i+1,b);
                row = i+1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
                %% Second direction (up)
            elseif i-1 >=1 && (board(i-1,b) == 1 || board(i-1,b) == 0)
                guess = board(i-1,b);
                row = i-1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                %% Third direction (right)
            elseif b+1 <= 10 && (board(i,b+1) == 0 || board(i,b+1) == 1)
                guess = board(i,b+1);
                row = i;
                col = b+1;
                % Sets position = 3 if a miss and = 5 if a horizontal hit
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                %% Fourth direction (left)
            elseif b-1 >= 1 && (board(i,b-1) == 0 || board(i,b-1) == 1)
                guess = board(i,b-1);
                row = i;
                col = b-1;
                % Sets position = 3 if a miss and = 5 if a horizontal hit
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
            else
            end
        end
        
    end
end


%% If no 2 is found

% Search for a 4 (vertical ship)

for i = 1:10
    for b = 1:10
        if board(i,b) == 4  && ~done
            
            if i+1 <=10 && (board(i+1,b) == 1 || board(i+1,b) == 0)
                guess = board(i+1,b);
                row = i+1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
                
            elseif i-1 >= 1 && (board(i-1,b) == 1 || board(i-1,b) == 0)
                guess = board(i-1,b);
                row = i-1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
            end
        end
        
    end
end

%% If no 2 or 4 is found

% Search for a 5 (horizontal ship)



for i = 1:10
    for b = 1:10
        if board(i,b) == 5  && ~done
            
            if b+1 <= 10 && (board(i,b+1) == 1 || board(i,b+1) == 0)
                guess = board(i,b+1);
                row = i;
                col = b+1;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
                
            elseif b-1>=1 &&  (board(i,b-1) == 1 || board(i,b-1) == 0)
                guess = board(i,b-1);
                row = i;
                col = b-1;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
            end
        end
    end
    
    
end


%% If conditions are not met, chooses any adjacent to a hit
for i = 1:10
    for i = 1:10
        if (board(i,b) == 2 || board(i,b) == 4 || board(i,b) == 5) && ~done
            
            %% First direction (down)
            if i+1 <= 10 &&  (board(i+1,b) == 1 || board(i+1,b) == 0)
                guess = board(i+1,b);
                row = i+1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                
                %% Second direction (up)
            elseif i-1 >=1 && (board(i-1,b) == 1 || board(i-1,b) == 0)
                guess = board(i-1,b);
                row = i-1;
                col = b;
                % Sets position = 3 if a miss and = 4 if a hit (vertical ship)
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 4;
                    newboard(i,b) = 4;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                %% Third direction (right)
            elseif b+1 <= 10 && (board(i,b+1) == 0 || board(i,b+1) == 1)
                guess = board(i,b+1);
                row = i;
                col = b+1;
                % Sets position = 3 if a miss and = 5 if a horizontal hit
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
                %% Fourth direction (left)
            elseif b-1 >= 1 && (board(i,b-1) == 0 || board(i,b-1) == 1)
                guess = board(i,b-1);
                row = i;
                col = b-1;
                % Sets position = 3 if a miss and = 5 if a horizontal hit
                if guess == 0;
                    newboard(row,col) = 3;
                    plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                elseif guess == 1;
                    newboard(row,col) = 5;
                    newboard(i,b) = 5;
                    plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
                    axis(axes,[0,10,0,10]);
                    set(axes,'XTickLabels','','YTickLabel','');
                    grid(axes,'on');
                    hold(axes,'on');
                    drawnow;
                    done = true;
                end
            else
            end
        end
        
    end
end










%% If None of the above are found--Random Guess
while ~done
    %Makes a guess
    row = randi(10);
    col = randi(10);
    guess = newboard(row,col);
    % Sets position = 3 if a miss and = 2 if a hit
    if guess == 0;
        newboard(row,col) = 3;
        plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
        axis(axes,[0,10,0,10]);
        set(axes,'XTickLabels','','YTickLabel','');
        grid(axes,'on');
        hold(axes,'on');
        drawnow;
        done = true;
    elseif guess == 1;
        newboard(row,col) = 2;
        plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
        axis(axes,[0,10,0,10]);
        set(axes,'XTickLabels','','YTickLabel','');
        grid(axes,'on');
        hold(axes,'on');
        drawnow;
        done = true;
    end
end
end

