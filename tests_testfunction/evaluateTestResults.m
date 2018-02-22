% % gather all results in one big cell array
% solvers = horzcat(C.cell_solvers_local,C.cell_solvers_global);
% cell_results_all = cell(0);
% for j=1:length(solvers)
%     solver = solvers{j};
%     if any(strcmp(solver,{'gss'}))
%         continue;
%     end
%     file = ['results/cell_results_test_' solver '_2000_20_.mat'];
%     if exist(file,'file')
%         load(file);
%         cell_results_all = vertcat(cell_results_all,cell_results);
%     end
% end
% 
% % pre-processing
% cell_results_all = EvaluationHelper.f_preprocess(cell_results_all);
% 
% % get best results
% cell_results_best = EvaluationHelper.f_extractBestResults(cell_results_all);
% 
% % for j=1:length(cell_results_best), cell_results_best{j}.printTiny(); end
% 
% % how many solutions did the algorithms find?
% map_shares = EvaluationHelper.f_getSolvedFraction(cell_results_best);
% 
% % and avgd over all iterates?
% map_shares_all = EvaluationHelper.f_getSolvedFraction(cell_results_all);
% 
% % what about smooth/unimodal?
% cell_results_best_smooth = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,1,2,2);
% map_shares_smooth = EvaluationHelper.f_getSolvedFraction(cell_results_best_smooth);
% 
% cell_results_best_nonsmooth = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,0,2,2);
% map_shares_nonsmooth = EvaluationHelper.f_getSolvedFraction(cell_results_best_nonsmooth);
% 
% cell_results_best_convex = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,2,1,2);
% map_shares_convex = EvaluationHelper.f_getSolvedFraction(cell_results_best_convex);
% 
% cell_results_best_nonconvex = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,2,0,2);
% map_shares_nonconvex = EvaluationHelper.f_getSolvedFraction(cell_results_best_nonconvex);
% 
% cell_results_best_unimodal = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,2,2,1);
% map_shares_unimodal = EvaluationHelper.f_getSolvedFraction(cell_results_best_unimodal);
% 
% cell_results_best_multimodal = EvaluationHelper.f_getAllHaving(cell_results_best,-1,Inf,2,2,0);
% map_shares_multimodal = EvaluationHelper.f_getSolvedFraction(cell_results_best_multimodal);
% 
% % and over all
% cell_results_all_smooth = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,1,2,2);
% map_shares_all_smooth = EvaluationHelper.f_getSolvedFraction(cell_results_all_smooth);
% 
% cell_results_all_nonsmooth = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,0,2,2);
% map_shares_all_nonsmooth = EvaluationHelper.f_getSolvedFraction(cell_results_all_nonsmooth);
% 
% cell_results_all_convex = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,2,1,2);
% map_shares_all_convex = EvaluationHelper.f_getSolvedFraction(cell_results_all_convex);
% 
% cell_results_all_nonconvex = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,2,0,2);
% map_shares_all_nonconvex = EvaluationHelper.f_getSolvedFraction(cell_results_all_nonconvex);
% 
% cell_results_all_unimodal = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,2,2,1);
% map_shares_all_unimodal = EvaluationHelper.f_getSolvedFraction(cell_results_all_unimodal);
% 
% cell_results_all_multimodal = EvaluationHelper.f_getAllHaving(cell_results_all,-1,Inf,2,2,0);
% map_shares_all_multimodal = EvaluationHelper.f_getSolvedFraction(cell_results_all_multimodal);
% 
% % what about dim?
% cell_cell_results_best_dim = cell(C.nDims,1);
% cell_map_best_dim_shares = cell(C.nDims,1);
% for j=1:C.nDims
%     cell_cell_results_best_dim{j} = EvaluationHelper.f_getAllHaving(cell_results_best,C.arr_dims(j),C.arr_dims(j),2,2,2);
%     cell_map_best_dim_shares{j} = EvaluationHelper.f_getSolvedFraction(cell_cell_results_best_dim{j});
% end
% 
% % and over all, and time and fevals
% cell_cell_results_all_dim = cell(C.nDims,1);
% cell_map_all_dim_shares = cell(C.nDims,1);
% cell_map_all_dim_time   = cell(C.nDims,1);
% cell_map_all_dim_fevals = cell(C.nDims,1);
% map_all_time = EvaluationHelper.f_getAverageTimePerAlg(cell_results_all);
% for j=1:C.nDims
%     cell_cell_results_all_dim{j} = EvaluationHelper.f_getAllHaving(cell_results_all,C.arr_dims(j),C.arr_dims(j),2,2,2);
%     cell_map_all_dim_shares{j} = EvaluationHelper.f_getSolvedFraction(cell_cell_results_all_dim{j});
%     cell_map_all_dim_time{j}   = EvaluationHelper.f_getAverageTimePerAlg(cell_cell_results_all_dim{j});
%     cell_map_all_dim_fevals{j} = EvaluationHelper.f_getAverageFevalsPerAlg(cell_cell_results_all_dim{j});
% end
% 
% %% save data
% 
% save('results/maps_evaluate','map_shares','map_shares_all','map_shares_smooth','map_shares_nonsmooth','map_shares_convex','map_shares_nonconvex','map_shares_unimodal','map_shares_multimodal',...
%     'map_shares_all_smooth','map_shares_all_nonsmooth','map_shares_all_convex','map_shares_all_nonconvex','map_shares_all_unimodal','map_shares_all_multimodal',...
%     'cell_map_best_dim_shares','cell_map_all_dim_shares','cell_map_all_dim_time','cell_map_all_dim_fevals','map_all_time');


%% load data

load('results/maps_evaluate');

%% visualize
cell_keys = solvers_for_output; %keys(map_shares);
nKeys = length(cell_keys);

colors = distinguishable_colors(nKeys);
markers = {'o','+','*','.','x','s','d','^','v','<','>','p','h','o','+','*','.','x','s','d','^','v','<','>','p','h','o','+','*','.','x','s','d','^','v','<','>','p','h'};
markers = markers(1:nKeys);
axes('NextPlot','replacechildren', 'ColorOrder',colors); 

legendon = 'off';

% TextSizes.DefaultAxesFontSize = 10;
% TextSizes.DefaultTextFontSize = 10;
% set(0,TextSizes);
% if set_sizes, set(gcf, 'Position', [520 378 600 420]);

% smoothness, convexity, modality

% nColumns = 7;
% v_x = 1:nColumns;
% v_y = zeros(nKeys,nColumns);
% cell_maps = {map_shares,map_shares_smooth,map_shares_nonsmooth,map_shares_convex,map_shares_nonconvex,map_shares_unimodal,map_shares_multimodal};
% for j=1:nKeys
%    key_j = cell_keys{j};
%    for k=1:nColumns
%        tmp_map = cell_maps{k};
%        v_y(j,k) = tmp_map(key_j);
%    end
% end
% % sort
% [v_y,index] = sortrows(v_y,1,'descend');
% cell_keys_tmp = cell_keys(index);
% colors_tmp = colors(index,:);
% markers_tmp = markers(index);
% %display
% fig = figure('name','smooth-convex-unimodal');
% hold on;
% for j=1:nKeys
%     plot(v_x,v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
% end
% hold off;
% legend(legendon,'Location','northeastoutside');
% xticks(1:nColumns);
% xticklabels({'all','smooth','nonsmooth','convex','nonconvex','unimodal','multimodal'});
% xlabel('function category');
% ylabel('solved problems [%]');
% ylim([0,1]);
% pbaspect([1 1 1]);
% saveas(fig, [pwd '/images/smooth-convex-unimodal.png']);

nColumns = 5;
v_x = 1:nColumns;
v_y = zeros(nKeys,nColumns);
cell_maps = {map_shares,map_shares_smooth,map_shares_nonsmooth,map_shares_convex,map_shares_nonconvex};
for j=1:nKeys
   key_j = cell_keys{j};
   for k=1:nColumns
       tmp_map = cell_maps{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_smooth_convex = v_y;
% sort
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
%display
fig = figure('name','smooth-convex');
hold on;
for j=1:nKeys
    plot(v_x,100*v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
end
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:nColumns);
xticklabels({'all','smooth','nonsmooth','convex','nonconvex'});
xlabel('function category');
ylabel('solved problems [%]');
ylim([0,100]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/smooth_convex'], 'epsc');

% and for all
% cell_keys = keys(map_shares_all);
% nKeys = length(cell_keys);

nColumns = 5;
v_x = 1:nColumns;
v_y = zeros(nKeys,nColumns);
cell_maps = {map_shares_all,map_shares_all_smooth,map_shares_all_nonsmooth,map_shares_all_convex,map_shares_all_nonconvex};
for j=1:nKeys
   key_j = cell_keys{j};
   for k=1:5
       tmp_map = cell_maps{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_smooth_convex_all = v_y;
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
fig = figure('name','smooth-convex-all');
hold on;
for j=1:nKeys
    plot(v_x,100*v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
end
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:nColumns);
xticklabels({'all','smooth','nonsmooth','convex','nonconvex'});
xlabel('function category');
ylabel('solved problems [%]');
ylim([0,100]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/smooth-convex-all'], 'epsc');

% dims
v_x = 1:C.nDims;
v_y = zeros(nKeys,1);
for j=1:nKeys
   key_j = cell_keys{j};
   for k=1:C.nDims
       tmp_map = cell_map_best_dim_shares{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_dims = v_y;
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
fig = figure('name','dims');
hold on;
for j=1:nKeys
    plot(v_x,100*v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
end
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:C.nDims);
xticklabels(C.arr_dims);
xtickangle(90);
xlabel('dimension');
ylabel('solved problems [%]');
ylim([0,100]);
xlim([1,C.nDims]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/dims'], 'epsc');

% and for all
v_x = 1:C.nDims;
v_y = zeros(nKeys,1);
for j=1:nKeys
   key_j = cell_keys{j};
   for k=1:C.nDims
       tmp_map = cell_map_all_dim_shares{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_dims_all = v_y;
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
fig = figure('name','dims-all');
hold on;
for j=1:nKeys
    plot(v_x,100*v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
end
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:C.nDims);
xticklabels(C.arr_dims);
xtickangle(90);
xlabel('dimension');
ylabel('solved problems [%]');
ylim([0,100]);
xlim([1,C.nDims]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/dims-all'], 'epsc');

% time
v_x = 1:C.nDims;
v_y = zeros(nKeys,1);
for j=1:nKeys
    key_j = cell_keys{j};
   for k=1:C.nDims
       tmp_map = cell_map_all_dim_time{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_time = v_y;
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
fig = figure('name','time');
for j=1:nKeys
    semilogy(v_x,v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
    hold on;
end
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:C.nDims);
xticklabels(C.arr_dims);
xtickangle(90);
xlabel('dimension');
ylabel('avg. time [s]');
xlim([1,C.nDims]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/time'], 'epsc');

% fevals
v_x = 1:C.nDims;
v_y = zeros(nKeys,1);
for j=1:nKeys
    key_j = cell_keys{j};
   for k=1:C.nDims
       tmp_map = cell_map_all_dim_fevals{k};
       v_y(j,k) = tmp_map(key_j);
   end
end
v_y_fevals = v_y;
[v_y,index] = sortrows(v_y,1,'descend');
cell_keys_tmp = cell_keys(index);
colors_tmp = colors(index,:);
markers_tmp = markers(index);
fig = figure('name','fevals');
hold on;
for j=1:nKeys
    plot(v_x,v_y(j,:),[markers_tmp{j} '-'], 'DisplayName', cell_keys_tmp{j}, 'color', colors_tmp(j,:)); 
end
plot(1:C.nDims,C.maxFunEvals{1}*ones(1,C.nDims),'-r','DisplayName','maxFunEvals');
hold off;
legend(legendon,'Location','northeastoutside');
xticks(1:C.nDims);
xticklabels(C.arr_dims);
xtickangle(90);
xlabel('dimension');
ylabel('avg. function evaluations');
xlim([1,C.nDims]);
% pbaspect([1 1 1]);
if set_sizes, set(gcf,'units','centimeters','position',[0,0,fig_width,fig_height]); end
saveas(fig, [pwd '/images/fevals'], 'epsc');

% legend

figHandle = figure('name','legend');
hold on;
for j = 1:nKeys
   plot([1,2],[1,2],[markers{j} '-'], 'DisplayName', cell_keys{j}, 'color', colors(j,:));
end
legHandle = legend('show');
saveLegendToImage(figHandle,legHandle,'images/legend','epsc');

function saveLegendToImage(figHandle, legHandle, ...
fileName, fileType)

%make all contents in figure invisible
allLineHandles = findall(figHandle, 'type', 'line');

for i = 1:length(allLineHandles)

    allLineHandles(i).XData = NaN; %ignore warnings

end

%make axes invisible
axis off

%move legend to lower left corner of figure window
legHandle.Units = 'pixels';
boxLineWidth = legHandle.LineWidth;
%save isn't accurate and would swallow part of the box without factors
legHandle.Position = [6 * boxLineWidth, 6 * boxLineWidth, ...
    legHandle.Position(3), legHandle.Position(4)];
legLocPixels = legHandle.Position;

%make figure window fit legend
figHandle.Units = 'pixels';
figHandle.InnerPosition = [1, 1, legLocPixels(3) + 12 * boxLineWidth, ...
    legLocPixels(4) + 12 * boxLineWidth];

%save legend
saveas(figHandle, fileName, fileType);

end
