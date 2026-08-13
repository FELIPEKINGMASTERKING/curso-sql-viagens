# Sistema de Reservas de Viagens - SQL (Refatorado)

Este repositório contém o script SQL para um sistema de agência de viagens. O projeto original fazia parte de um curso de banco de dados, porém apresentava diversos erros de cronologia de execução, colunas inexistentes e falta de chaves primárias que impediam a manipulação visual dos dados.

## 🚀 Melhorias Técnicas Implementadas por Mim:

- **Correção da Linha do Tempo de Execução**: Reorganizei a ordem dos scripts para garantir que tabelas e chaves estrangeiras sejam criadas antes da inserção da massa de dados.
- **Resolução do Erro #1046**: Adicionado o comando de escopo explícito `USE viagens;` no topo dos arquivos.
- **Normalização de Dados Antecipada**: Ajustei a tabela de `usuarios` para nascer com as colunas separadas de endereço (`rua`, `numero`, `cidade`, `estado`), evitando falhas de queries antigas que buscavam a coluna deletada `endereco`.
- **Habilitação da Edição Visual no phpMyAdmin**: Correção e aplicação das restrições de `PRIMARY KEY` e `AUTO_INCREMENT` nas tabelas de `reservas` e `destinos`, liberando as ações de Editar, Copiar e Excluir diretamente pela interface.
- **Otimização de Performance**: Aplicação correta de índices (`CREATE INDEX`) para buscas textuais rápidas.

## 🛠️ Como Rodar o Projeto

1. Abra o seu gerenciador de banco de dados (MySQL / phpMyAdmin).
2. Copie o conteúdo do arquivo `script_viagens_corrigido.sql`.
3. Cole na aba SQL e execute tudo de uma vez.
