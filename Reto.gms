option optcr=0.0001;

sets
i /1*24/
;

alias
(i,j); 

table
c(i,j)
	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24
1	1000	13	3	16	4	14	14	17	20	14	23	18	31	21	6	18	25	11	23	16	16	30	12	28
2	13	1000	58	23	32	25	43	27	28	44	13	27	46	33	44	26	26	9	29	36	24	36	31	37
3	3	58	1000	40	35	36	23	36	34	24	65	36	18	54	25	35	38	56	38	39	37	33	36	33
4	16	22	38	1000	10	14	23	5	8	24	30	7	26	14	25	6	4	21	7	14	3	18	14	21
5	4	32	34	9	1000	12	19	3	4	20	39	5	22	12	21	5	4	30	5	11	5	7	12	6
6	14	24	36	16	12	1000	21	13	11	22	31	12	24	23	23	12	13	26	16	21	13	19	5	19
7	14	43	25	25	20	21	1000	22	19	1	50	21	12	39	2	20	23	42	24	24	22	19	21	18
8	17	26	36	5	3	13	22	1000	4	22	33	2	24	12	23	3	1	25	5	14	3	13	13	8
9	20	30	34	8	4	11	19	3	1000	20	37	2	22	15	20	2	4	28	7	19	5	9	11	8
10	14	41	23	23	18	19	1	20	17	1000	48	19	12	37	2	18	21	39	24	22	20	19	19	19
11	23	12	66	30	40	32	51	35	36	52	1000	34	53	40	52	34	34	20	37	43	32	44	57	45
12	18	26	34	5	4	11	19	2	2	20	34	1000	21	15	20	1	3	25	8	19	3	9	11	8
13	31	44	19	26	21	22	9	22	20	10	51	22	1000	40	10	21	24	42	20	15	23	14	22	16
14	21	32	45	13	11	30	31	11	14	32	40	23	33	1000	32	22	12	31	8	15	13	16	22	17
15	6	42	24	23	19	20	3	20	18	4	49	19	10	38	1000	19	22	40	22	22	20	17	20	17
16	18	26	33	8	6	10	18	3	3	19	33	1	21	16	20	1000	3	24	9	18	4	16	10	16
17	25	26	38	4	5	13	23	2	5	24	33	3	26	12	25	4	1000	24	5	13	2	16	13	10
18	11	8	55	20	29	26	41	25	25	41	19	24	43	30	42	23	24	1000	26	33	22	34	29	35
19	23	29	38	7	5	15	23	5	7	24	36	8	26	9	25	9	6	27	1000	8	7	10	15	10
20	16	37	40	14	12	24	25	14	15	26	44	24	17	17	26	23	13	36	9	1000	14	11	24	12
21	16	24	37	2	6	13	22	3	7	23	32	5	24	14	23	5	2	23	6	15	1000	20	13	19
22	30	37	32	15	7	20	17	12	8	18	44	9	20	18	18	10	14	35	8	10	15	1000	20	3
23	12	35	36	16	12	5	21	13	11	22	58	12	24	23	22	12	13	33	16	21	13	19	1000	19
24	28	37	33	15	6	15	18	8	7	19	44	8	21	17	19	9	14	35	8	12	15	3	14	1000
;

variables
z;

positive variable
u(i);

binary variables
x(i,j);

equations
obj
r1
r2
r3;

obj.. z=e=sum((i,j),c(i,j)*x(i,j));
r1(j).. sum(i,x(i,j) $(ord(i) <>ord(j)))=e=1;
r2(i).. sum(j,x(i,j) $(ord(i) <>ord(j)))=e=1;
r3(i,j)$(ord(i)>1 and ord(j)>1 and (ord(i) <>ord(j))).. u(i)-u(j)+card(i)*x(i,j)=l=card(i)-1;


model Reto/all/;
solve Reto using MIP minimizing z; 