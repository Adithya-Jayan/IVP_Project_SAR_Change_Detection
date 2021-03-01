clear all;
data1=load('trainOttawaSAR_x.mat');
train_x=data1.train_x;
train_x(1,:)=[];
data2=load('trainOttawaSAR_y1.mat');
train_y=data2.train_y;

%%����22�У���������
for i=1:6
   train_x(i,:)=[];
   train_y(i,:)=[];
end

%%  ex1 train a 100 hidden unit RBM and visualize its weights
%�趨���㵥Ԫ��Ϊ100�������Ӳ㵥Ԫ��Ϊ���������ĸ��������������ݾ���
rand('state',0)
dbn.sizes = [250 200 100];
opts.numepochs =   1; %�Ǽ���ʱ����������ص�����ԪȨֵ�ͷ�ֵ�Ĵ���
%ѵ����������ͬ����������������ѵ����ʱ��1��ʱ��11.41%error��5��ʱ��4.2%error��10��ʱ��2.73%error
opts.batchsize = 100;  %ÿ������һ��batchsize��batch��ѵ����Ҳ����ÿ��batchsize�������͵���һ��Ȩֵ�������ǰ����������������ˣ�������������������˲ŵ���һ��Ȩֵ
opts.momentum  =   0;%����
opts.alpha     =   1; %ѧϰ��
dbn = dbnsetup(dbn, train_x, opts);  %����DBN���磬������
dbn = dbntrain(dbn, train_x, opts);%����ѵ��������ѵ������
%figure; visualize(dbn.rbm{1}.W');   %  Visualize the RBM weights
disp('DBN finished and its parameter is');  
disp(opts);


%%Ͷ��BP����ѵ�����������У��������������������Ҳ��Լ���δ�������
%unfold dbn to nn
nn = dbnunfoldtonn(dbn, 2); %1Ϊ�����ڵ���
nn.activation_function = 'sigm';  %nnsetup�ײ��ﱾ���м�������趨��
                                   %��������ݾ���Ӧ�ý����˸ı�

%train nn
opts.numepochs =  1;
opts.batchsize = 100;
%���fine tuning����ѵ��һ��NN�Ϳ�����
nn = nntrain(nn, train_x, train_y, opts);
%�ò�����������
%����������������nn�����������õ�һ����ֵͼƬ��

data3=load('testYellow_x.mat');
test_x=data3.test_x;
test_x(1,:)=[];
labels=nnpredict(nn, test_x);
%%
counts=0;
for ii=1:size(labels)
    if labels(ii)==1
        counts=counts+1;
    end
end
save('labels1.mat','labels');
%%

%����Ԥ�����labels�ع���һ��Ԥ���ֵͼƬtest_y
%[er, bad] = nntest(nn, test_x, test_y);

%assert(er < 0.10, 'Too big error');
%disp(er);

