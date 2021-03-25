% produce Fig. 4 in the paper
Xdata1 = XdataEye;
factors = {'backMirror', 'pupilMean', 'fMax', 'fStd', 'pupilStd', 'road', 'fMean','sAmpMean', 'sAmpStd'};
close all
figure
for i = 1 : size(Xdata,2)
    temp = Xdata1(:,i);
    if length(unique(temp))>100
        
        [temp,E] = discretize(temp,18);
        
        Xdata1(:,i) = temp;
        
        subplot(3,3,i)
        yyaxis left
        boxplot(SHAPEye(:,i), Xdata1(:,i))
        set(findobj(gca,'type','line'),'linew',1)
        yyaxis right
        histogram(temp,'FaceAlpha',.05)
        ylim([0 1000])
        if i == 2
            E = round(E,1);
        elseif i==5
            E = round(E,2);
        end
        xticklabels(num2cell(E))
        xlabel(factors{i})
    else
        subplot(3,3,i)
        yyaxis left
        Xpos = unique(temp);
 
        boxplot(SHAPEye(:,i), Xdata1(:,i),'positions', Xpos, 'labels', Xpos)
       
        set(findobj(gca,'type','line'),'linew',1)

        yyaxis right
        if i == 7
            histogram(temp,20,'FaceAlpha',.1)
            ylim([0 1000])
        else
            histogram(temp,'FaceAlpha',.05)
            ylim([0 1000])
            
        end
        temp = sort(unique(temp));
        %xticklabels(num2cell(temp'))
        xlabel(factors{i})
    end
end
[r, p]=corr(Xdata,SHAPEye);
p = diag(p)
r = diag(r)

%% Produce Fig. 3 in the paper
Xdata1 = XdataAll;
factors = {'videoLength', 'correctDecision', 'decisionTime',...
 'difficulty', 'backMirror', 'drivingFrequency', 'pupilMean',...
 'decisionMade', 'fMean', 'age', 'road', 'pupilChange', 'danger','fMax'}; 
close all
Ind = 1:14;
usefactors = factors(Ind);
figure
for j = 1 : length(Ind)
    i = Ind(j);
    temp = Xdata1(:,i);
    if length(unique(temp))>50
        
        [temp,E] = discretize(temp,18);
         E = round(E,1);
        Xdata1(:,i) = temp;
        
        subplot(5,3,j)
        yyaxis left
        boxplot(SHAPAll(:,i), Xdata1(:,i))
        set(findobj(gca,'type','line'),'linew',1)
        yyaxis right
        histogram(temp,'FaceAlpha',.05)
        ylim([0 1000])
                if i == 3 || i==7
                    E = round(E,1);
                elseif i == 12
                    E = round(E,2);
                elseif i==4||i==8||i==13
                    E = round(E);
                
                end
        xticklabels(num2cell(E))
        xlabel(usefactors{j})
    else
        subplot(5,3,j)
       
        
        yyaxis right
        %         if i == 1
        %             edges = [0 2 5 7 10 15];
        %             histogram(temp,edges,'FaceAlpha',.05)
        %             ylim([0 1000])
        %         else
        if j == 1 
         
        histogram(temp,'FaceAlpha',.05)
        ylim([0 1000])
        xlim([min(temp) max(temp)])
        temp1 = sort(unique(temp));
        xticklabels(temp1')
        xlabel(usefactors{j})
        
        else
            histogram(temp,'FaceAlpha',.05)
        ylim([0 1000])
                temp = sort(unique(temp));
        xticklabels(num2cell(temp'))
        xlabel(usefactors{j})
        end
      
         yyaxis left
         Xpos = unique(temp);
 
        boxplot(SHAPAll(:,i), Xdata1(:,i),'positions', Xpos, 'labels', Xpos)
       
        set(findobj(gca,'type','line'),'linew',1)

        
    end
end
%%
[r, p]=corr(XdataAll,SHAPAll);
p = diag(p)
r = diag(r)
[r, p]=corr(XdataAll,SHAPAll,'Type','Spearman');
ind = [1 2 6 8];
p = diag(p)
r = diag(r)
p(ind)
r(ind)


