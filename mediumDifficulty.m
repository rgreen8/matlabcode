function newboard = mediumDifficulty(board, axes)

newboard = board;

%Establish a variable that will mark a successful Hit
hitmarker = 4;

%Call in the field of probability 
newfield = evalin('base','field');

%Set up function to run for one move only by using a while loop with a done
%variable
done = false;

while ~done
    
    %FIND THE MAX VALUE AND ITS POSITION IN THE ARRAY
    max = 0;
    for ix  = 1:10
        for iy = 1:10
            %Can't count any value that has already been guessed
            if (newfield(ix, iy) >= max && newfield(ix, iy) ~= 0  && newfield(ix, iy) ~= 4)
                row = ix;
                col = iy;
                max = newfield(ix,iy);
                
            end
        end
    end
    %Establishes a Guess Value to compare to the board that contains the
    %pieces
    guess = newboard(row,col);
    %% Update The Actual Board
    if guess == 0;
        %Rename the point as a miss
        newboard(row,col) = 3;
        plot(axes,col - .5,10 - row + .5,'ob','MarkerSize',20);
        axis(axes,[0,10,0,10]);
        set(axes,'XTickLabels','','YTickLabel','');
        grid(axes,'on');
        hold(axes,'on');
        drawnow;
        
    elseif guess == 1;
        %Rename the point as a hit
        newboard(row,col) = 2;
        plot(axes,col - .5,10 - row + .5,'xr','MarkerSize',20);
        axis(axes,[0,10,0,10]);
        set(axes,'XTickLabels','','YTickLabel','');
        grid(axes,'on');
        hold(axes,'on');
        drawnow;
        
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Update the Probablity of the Field 
    %Change the Probablity if the Shot is a Miss
    rguess = row;
    cguess = col;
    if guess == 0
        newfield(rguess,cguess) = 0;
        for ir=1:10
            for ic=1:10
                %Reduce the chance of Ship being either vertical or
                %horizontal to the point
                if (ir == row || ic == col)
                    if (newfield(ir, ic) ~= 0 && newfield(ir, ic) ~= hitmarker)
                        newfield(ir, ic) = newfield(ir,ic) -.5*newfield(ir,ic);
                    end
                    % Increase the Diagnols at a slope of +1, relative to
                    % the point chosen
                elseif ((ir == (ir - col + row)  || ic == (ic - row + col)))
                    if (newfield(ir, ic) ~= 0 && newfield(ir, ic) ~= hitmarker)
                        newfield(ir, ic) = newfield(ir,ic) +.2*newfield(ir,ic);
                    end
                    % Increase the Diagnols at a slope of -1, relative to
                    % the point chosen
                elseif (ir == (-ir + col + row)  || ic == (-ic + row + col) )
                    if (newfield(ir, ic) ~= 0 && newfield(ir, ic) ~= hitmarker)
                        newfield(ir, ic) = newfield(ir,ic) +.2*newfield(ir,ic);
                    end
                    %Increase the chance of a Ship being anywhere else
                else
                    if (newfield(ir, ic) ~= 0  && newfield(ir, ic) ~= hitmarker)
                        newfield(ir, ic) = newfield(ir,ic) +.2*newfield(ir,ic);
                    end
                end
            end
        end
        %No DONE statement earlier because it needs to update the
        %probablity board first
        done = true;
        % Change Probablity for a Hit
    elseif guess == 1
        newfield(rguess,cguess) = hitmarker;
        for ir2=1:10
            for ic2=1:10
                %Increase the chance of ship being either vertical or
                %horizontal to the point, as it has two be one of those to
                %expa
                if ((ir2 == row || ic2 == col) && newfield(ir2, ic2) ~= 0 && newfield(ir2, ic2) ~= hitmarker)
                    if (newfield(ir2, ic2) ~= 0 && newfield(ir2, ic2) ~= hitmarker)
                        newfield(ir2, ic2) = newfield(ir2,ic2) + .2*newfield(ir2,ic2);
                    end
                    % Decrease the Diagnols at a slope of +1, relative to
                    % the point chosen, as a ship should be  horizontal of
                    % vertical
                elseif ((ir2 == (ir2 - col + row)  || ic2 == (ic2 - row + col)) )
                    if (newfield(ir2, ic2) ~= 0 && newfield(ir2, ic2) ~= hitmarker)
                        newfield(ir2, ic2) = newfield(ir2,ic2) -0.2*newfield(ir2,ic2);
                    end
                    % Decrease the Diagnols at a slope of -1, relative to
                    % the point chosen, as a ship should be  horizontal of
                    % vertical
                elseif (((ir2 == -ir2 + col + row  || ic2 == -ic2 + row + col)) )
                    if (newfield(ir2, ic2) ~= 0 && newfield(ir2, ic2) ~= hitmarker)
                        newfield(ir2, ic2) = newfield(ir2,ic2) -0.2*newfield(ir2,ic2);
                    end
                    %Decrease the chance of a Ship being anywhere else, as
                    %we want the program to focus in around the point 
                else
                    if (newfield(ir2, ic2) ~= 0 && newfield(ir2, ic2) ~= hitmarker)
                        newfield(ir2, ic2) = newfield(ir2,ic2) -0.2*newfield(ir2,ic2);
                    end
                end
            end
        end
        %No DONE statement earlier because it needs to update the
        %probablity board first
        done = true;
    end
end
assignin('base','field',newfield);
end