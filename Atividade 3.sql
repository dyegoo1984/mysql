/* Concluído o projeto e montado o projeto de banco de dados, imagine melhorias no banco e
planeje rotinas de manutenção e administração para a base criada na etapa anterior.
Atividade
Utilizando o banco de dados criado na etapa anterior, siga estas orientações:*/

-- 1. Ajuste questões de segurança, incluindo usuários, papéis e permissões.

create user 'gerente_aciolli'@'localhost' identified by '@c10ll1';
create user 'batista_supervisora'@'localhost' identified by 'B@7157@';
create user 'carlos_vendedor'@'localhost' identified by 'C@rl05';
create user 'vendedora_dolores'@'localhost' identified by 'D0l0r35';
create user 'elias_assistente'@'localhost' identified by '3rn@nd35';
create user 'fernanda_assistente'@'localhost' identified by 'F@9und35';

create role 'Gestao';
		grant select, insert, update on Construtora_Oliveira.* to 'Gestao';
        
create role 'Venda';
		grant select, insert, update on Construtora_Oliveira.Clientes to 'Venda';
        grant select, insert, update on Construtora_Oliveira.Vendas to 'Venda';
        grant select on Construtora_Oliveira.Catalogo_Construcoes to 'Venda';
        
create role 'Assistente';
		grant select, insert, update on Construtora_Oliveira.Clientes to 'Assistente';
        grant insert on Construtora_Oliveira.Vendas to 'Assistente';
        grant select on Construtora_Oliveira.Catalogo_Construcoes to 'Assistente';
        
		grant 'Gestao' to 'gerente_aciolli'@'localhost', 'batista_supervisora'@'localhost';
		grant 'Venda' to 'carlos_vendedor'@'localhost', 'vendedora_dolores'@'localhost';
		grant 'Assistente' to 'elias_assistente'@'localhost',  'fernanda_assistente'@'localhost';

-- 2. Crie visões no banco de dados para consultas mais frequentes.
		-- Ficha de funcionarios.
create view ficha_funcionarios as
	select f.idFuncionario as Codigo, f.nomeFuncionario as Nome, c.cargo as Cargo, c.remuneracao as Remuneracao
		from Funcionarios f join Cargo c on f.cargoFuncionario = c.idCargo
			order by f.idFuncionario asc;
            
		-- Vendas por funcionario
create view vendas_funcionario as
	select v.dataVenda as Data, f.nomeFuncionario as Funcionario, cc.valorConstrucao as Valor
		from Vendas v join Funcionarios f on v.vendedor = f.idFuncionario join Catalogo_Construcoes cc on v.construcao = cc.idConstrucao
			order by f.nomeFuncionario asc;
            
-- 3. Crie ao menos uma stored function, um stored procedure ou um trigger para o banco de dados, selecionando uma funcionalidade que seja adequada para tanto.
delimiter //
create procedure totalVendasFuncionario(funcionario int)     -- Para acompanhar a produtividade de cada funcionario. 
    begin
			    select f.nomeFuncionario as Funcionario, sum(cc.valorConstrucao) as Total_Vendas
					from Vendas v join Funcionarios f on v.vendedor = f.idFuncionario join Catalogo_Construcoes cc on v.construcao = cc.idConstrucao
						where v.vendedor = funcionario
							group by v.vendedor;
    end
//
delimiter ;

call totalVendasFuncionario(5);

-- 4. Crie ao menos um índice composto para uma das tabelas.
create index funcionarios on Funcionarios(nomeFuncionario, cargoFuncionario);

-- 5. Descreva textualmente uma rotina de administração de banco de dados, prevendo backups, restore e checagem de integridade periódica.

/*
		DIARIAMENTE: 
				- Assistentes cadastram novos clientes, consultam o cadastro para dar sequencia a um atendimento, ou atualizam o cadastro com novas informações formecidas pelo cliente.
				Além disso podem consultar o catalogo de Construções, e inserir as vendas que possam acabar fechando. 
                
                - Vendedores podem cadastrar, atualizar ou apenas consultar tanto clientes quanto vendas efetivadas, além de também poderem consultar o catalogo de Construções. 
                
                - Gestores podem inserir, consultar ou atualizar qualquer tabela do banco de dados, conforme seja necessário para a gestão do negócio.
                
                - Backup automatizado diário após o encerramento do expediente.
                
		SEMANALMENTE:
				- Gestores consultam a View "vendas_funcionario", para acompanhar o andamento dos negócios.
                
		OBSERVAÇÃO: 
				- Apenas o usuário Root tem acesso a apagar qualquer dado no Banco de Dados. 
                Caso haja essa necessidade, deve ser encaminhada solicitação para os gestores avaliarem e assim repassar ao gestor do Banco de Bados. 
                
*/