clear all;
close all;
prompt = {'left spatial boundary', 'right spatial boundary', 
          'number of spatial grid points','number of temporal grid points'};
dlg_title = 'Input';
num_lines = 1;
def = {'0', '2', '100', '100'};
answer = inputdlg(prompt, dlg_title, num_lines,def)
p=str2num(answer{:});