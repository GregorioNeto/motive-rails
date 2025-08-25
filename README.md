# Motive Rails

App Rails 8 + Inertia.js (React + Vite) que mostra frases motivacionais.

## Requisitos

- Ruby 3.4.5
- Node.js 18+ (recomendado 20+)
- SQLite3 (dev/test)

## Instalação

1) Instale gems
- `bundle install`

2) Instale dependências JS
- `npm install`

3) Configure banco
- `bin/rails db:setup`

## Executando em desenvolvimento

- `bin/dev`

Isso inicia:
- Rails em http://localhost:3100
- Vite (bundler) para os assets/React

Rotas úteis:
- Página principal (Quotes): http://localhost:3100/
- Exemplo Inertia: http://localhost:3100/inertia-example
- Healthcheck: http://localhost:3100/up

## Dados de exemplo (seeds)

Popule o banco com frases base e, opcionalmente, gere extras sintéticas:

- Somente base: `bin/rails db:seed`

As frases extras são geradas pelo gerador `Inspirational.build` (`app/models/inspirational.rb`).

## Como a página funciona

- Controller: `QuotesController#index` renderiza Inertia com `render inertia: "Quotes"` e props `quotes` e `random_quote`.
- Componente: `app/javascript/pages/Quotes.tsx` é resolvido pelo Inertia (ver `app/javascript/entrypoints/inertia.ts`).
- Botão “Me inspire” sorteia localmente uma frase da lista carregada.

## Dicas e solução de problemas

- Tela em branco/sem renderizar:
	- Verifique o console do navegador. Se aparecer “Missing Inertia page component: 'Quotes.tsx'”, confirme que o arquivo existe em `app/javascript/pages/Quotes.tsx` e que o controller usa `render inertia: "Quotes"`.
	- Confirme que o Vite está rodando (o `bin/dev` deve mostrar um processo `vite: bin/vite dev`).
	- O layout inclui `vite_typescript_tag "inertia"`; isso carrega o app Inertia somente quando necessário.

- Sem frases sendo exibidas:
	- Rode os seeds: `bin/rails db:seed`.
	- Para mais variedade, use `EXTRA_QUOTES=N`.

## Testes

- `bin/rails test`

## Deploy

Há um `Dockerfile` e suporte a Kamal, mas o deploy não está coberto aqui.
