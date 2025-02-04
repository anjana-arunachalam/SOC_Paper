wM_std_VEC = [0.05]; %0.01 0.025 0.05 0.075 0.1
wPq_std_VEC = [3e-4]; % 6e-4];% 1.2e-3];% 2.4e-3];
wPqdot_std_VEC = [2.4e-3];% 4.8e-3];% 9.6e-3];

listing = dir();
for i = 1:length(wM_std_VEC)%motor noise?
    for j = 1:length(wPq_std_VEC) %Noise on the joint positions? 
        for k = 1:length(wPqdot_std_VEC)% noise on the joint velocity
            wM_std = wM_std_VEC(i);
            wPq_std = wPq_std_VEC(j);
            wPqdot_std = wPqdot_std_VEC(k);
            
            forceField = 0; % no perturbation condition
            
            target = 'CIRCLE';
            saveName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(wM_std) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '_.mat'];
%             guessName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(0.05) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '.mat'];
            guessName = [];

            if ~contains( [listing(:).name] ,saveName )% only save these results, if the results from such a simulation doesn't exit in the directory
                %run the 6muscle_Feedforward_Feedback_Shooting algorithm to
                %get results
                [result,succes] = OCP_6muscles_FF_FB_final(target,forceField,wM_std,wPq_std,wPqdot_std,guessName);
                if succes == true
                    parsave(saveName,result);
                end
            end
            
            target = 'BAR';
            saveName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(wM_std) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '_.mat'];
%             guessName = ['result_time_0.8_CIRCLE_forceField_' num2str(forceField) '_' num2str(0.05) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '.mat'];
            guessName = [];
            if ~contains( [listing(:).name] ,saveName )
                [result,succes] = OCP_6muscles_FF_FB_final(target,forceField,wM_std,wPq_std,wPqdot_std,guessName);
                if succes == true
                    parsave(saveName,result);
                end
            end
            
            target = 'OBSTACLE';
            saveName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(wM_std) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '_.mat'];
%             guessName = ['result_time_0.8_' 'CIRCLE' '_forceField_' num2str(forceField) '_' num2str(wM_std) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '.mat'];
            guessName = [];
            if ~contains( [listing(:).name] ,saveName )
                [result,succes] = OCP_6muscles_FF_FB_final(target,forceField,wM_std,wPq_std,wPqdot_std,guessName);
                if succes == true
                    parsave(saveName,result);
                end
            end
            
            
            forceField = 200; % case with pertubation
            
            target = 'CIRCLE';
            saveName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(wM_std) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '_.mat'];
%             guessName = ['result_time_0.8_' target '_forceField_' num2str(forceField) '_' num2str(0.05) '_' num2str(wPq_std) '_' num2str(wPqdot_std) '.mat'];
            guessName = [];
            if ~contains( [listing(:).name] ,saveName )
                [result,succes] = OCP_6muscles_FF_FB_final(target,forceField,wM_std,wPq_std,wPqdot_std,guessName);
                if succes == true
                    parsave(saveName,result);
                end
            end
            % note that only the circle target is considered for the
            % pertubed forcefield case - and only multiple shooting methods
            % are used in this code
        end
    end
end