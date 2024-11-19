# Desafio-BugBank
Este repositório contém os arquivos de teste desenvolvidos para validar as funcionalidades do BugBank. Os testes foram implementados em Robot Framework e cobrem cenários relacionados a cadastro, login, transferência entre contas e validações de transferências.

# Arquivos
Abaixo, uma descrição de cada arquivo e seus respectivos objetivos:

## desafio_bugbank- vitor hugo dos santos- teste_cadastro.robot
Este arquivo testa o sistema de cadastro do BugBank. O teste é considerado PASS se o usuário conseguir realizar o cadastro utilizando dados válidos.

## desafio_bugbank- vitor hugo dos santos- login_logout.robot
Testa as funcionalidades de login e logout no BugBank. O teste é considerado PASS se um usuário recém-cadastrado conseguir:

- Fazer login com dados válidos.
- Realizar logout com sucesso.
## desafio_bugbank- vitor hugo dos santos- transfer.robot
Este arquivo valida o sistema de transferência entre contas. O teste é considerado PASS se:

- Dois usuários recém-cadastrados utilizarem dados válidos.
- Um deles realizar login e transferir fundos com sucesso para a conta do outro.
## desafio_bugbank- vitor hugo dos santos- checa_extrato.robot
Verifica o registro de transações no extrato da conta. O teste é considerado PASS se:

- Um usuário recém-cadastrado realizar login e efetuar uma transferência com sucesso para outro usuário.
- A transação aparecer corretamente no extrato do cliente que realizou a transferência.
## desafio_bugbank- vitor hugo dos santos- teste_cadastro_mesmo_email.robot
Testa o comportamento do sistema ao tentar cadastrar um novo usuário com um e-mail já utilizado. O teste é considerado PASS se o BugBank exibir uma mensagem adequada, como "e-mail já utilizado", e impedir o cadastro.

## desafio_bugbank- vitor hugo dos santos- teste_cadastro_nome_invalido.robot
Valida o sistema de cadastro ao utilizar nomes com caracteres especiais ou inválidos. O teste é considerado PASS se o BugBank impedir o cadastro e exibir uma mensagem de erro informando sobre os caracteres inválidos no campo de Nome.
