%% In this program, we will remove the unnecessary details from images.

function I = Removing_Boarders(I)
%% This function will remove the borders, which contain all or majority
%% zeros
%% Argument: I --> A color input
%%
%% Return: I --> A color image without any unnecessary details


if ndims(I) == 2
    [m, n] = size(I);
    removed_rows = [];
    removed_cols = [];
    for i = 1:m
        if sum(I(i,:)) < 1500
            removed_rows(end+1) = i;
        end
    end

    for i = 1:n
        if sum(I(:,i)) < 1500
            removed_cols(end+1) = i;
        end
    end

    I(removed_rows,:) =[];
    I(:,removed_cols) = [];
elseif ndims(I) == 3
    [m, n, ~] = size(I);
    removed_rows = [];
    removed_cols = [];
    for i = 1:m
        if sum(sum(I(i,:,:)))/3 < 2500
            removed_rows(end+1) = i;
        end
    end

    for i = 1:n
        if sum(sum(I(:,i,:)))/3 < 2500
            removed_cols(end+1) = i;
        end
    end

    I(removed_rows,:,:) =[];
    I(:,removed_cols,:) = [];
else
    print('Invalid Input')
end
return 
