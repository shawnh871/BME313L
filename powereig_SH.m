function [evect, eval_T, ea_T, iter] = powereig_SH(A, es, maxit)
% powereig will find the highest eigenvalue and the corresponding
% eigenvector
% powereig has the following outputs:
% evect = eigenvector
% eval_T = vector of eigenvalues
% ea_T = vector of approximate percent relative errors
% iter = number of iterations ran
% powereig has the following inputs:
% A = coefficient matrix
% es = pre-specified error limit
% maxit = maximum number of iterations

    n = length(A); % find the length of matrix A
    
    evect = ones(n,1); % initial eigenvector values (all 1s)
    eval_T = zeros(); % create empty matrix for eigenvalues
    ea_T =zeros(); % create empty matrix for approximate percent relative error values
     
    eval = 1; % initial eigenvalue
    
    iter = 0; % initialize iteration counter
    ea = 100; % initial approximate percent relative error
    
    while(1) % while loop for finding eigenvalues and eigenvectors
       
        evalold = eval; % set old eigenvalue to current eigenvalue
        
        evect = A*evect; % find new eigenvector
        eval = max(abs(evect)); % find eigenvalue from new eigenvector
        evect = evect./eval; % find normalized eigenvector
        
        iter = iter+1; % increment iteration counter
        
        eval_T(iter) = eval; % store current eigenvalue
        
        % update error
        if eval~=0 % check to see if eigenvalue is 0
            ea = abs((eval-evalold)/eval)*100; % calculate Ea
            ea_T(iter) = ea; % store current Ea
        end
        
        % check stopping criteria with pre-specified error and max iterations
        if (ea<=es || iter>=maxit)
            break;
        end
    end
    
    