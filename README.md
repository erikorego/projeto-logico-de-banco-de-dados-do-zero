# projeto-logico-de-banco-de-dados-do-zero

_TABELAS_ :
-------------------
1. *CLIENTES* -> **clients**:
    lista de todos os clientes que já fizeram algum serviço na oficina. Contém informações de veículo e identificação e classificação em PF ou PJ;
2. *Peças* -> **part**: representa o estoque de peças presente na oficina
3. *Funcionário* -> **employee**: Lista de funcionários na oficina, bem como seus cargos;
4. *Ordens de Serviço* -> **os**: Contem os dados de todas as ordens de serviço: valores, quem executou o serviço, o cliente atendido, o valor do serviço;
5. *peças por ordem de serviço* -> **parts_per_os**:representa a quantidade de peças usadas em uma determinada ordem de serviço.