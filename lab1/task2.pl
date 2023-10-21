% ������ ��������� ��������(�8�-213�-22)(�13).
% Variant ((13-1) mod 3)+1, +two.pl.
:- ['two.pl'].

% ������������ ������
print_all:-
    Groups = [101, 102, 103, 104], % ������ �����
    Subjects = ['����������','���������� ����������������','�������������� ������','�������������� ����������������','�����������','���������� ����'],
    print_group_averages(Groups),
    nl,
    print_subject_grade2(Subjects),
    nl,
    print_count_grade2(Groups).
% _______________________________________________________________________________________

% ������� ��� ������
print_group_averages([]).
print_group_averages([Group | Rest]) :-
    print_group_average(Group),
    print_group_averages(Rest).
print_subject_grade2([]).
print_subject_grade2([Subject | Rest]) :-
    print_grade2(Subject),
    print_subject_grade2(Rest).
print_count_grade2([]).
print_count_grade2([Subject | Rest]) :-
    print_count(Subject),
    print_count_grade2(Rest).
% _______________________________________________________________________________________

% ���������� �������� �������� ��� ������
average([], 0).
average(List, Avg) :-
    sum_list(List, Sum),
    length(List, Count),
    Avg is Sum / Count.

% ��������� ����� �� ��������
print_group_average(Group) :-
    findall(Rating, grade(Group, _, _, Rating), Ratings),
    average(Ratings, Avg),
    format('The average score of the group ~w: ~w~n', [Group, Avg]).

print_grade2(Subject) :-
    findall(Surname,grade(_,Surname,Subject,2),Surname),
    format('The subject that passed for 2 ~w, Surnames: ~w~n', [Subject, Surname]).

print_count(Group) :-
    findall(Surname,grade(Group,Surname,_,2), Surnames),
    length(Surnames,Length),
    format('The number of people who passed for 2 in the group ~w: ~w~n',[Group,Length]).
% ________________________________________________________________________________________
