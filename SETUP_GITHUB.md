# Setup GitHub - Luca Dias Site

## Status Atual ✓

- ✓ Arquivo principal renomeado para `index.html`
- ✓ Pasta `uploads/` removida
- ✓ Criado `.gitignore`
- ✓ Criado `README.md`
- ✓ Repositório git inicializado (aguardando commit)

## Próximos Passos

### 1. No Terminal (na pasta do projeto)

```bash
cd C:\Users\roberto\Downloads\luca_site

# Remover lock file do git
rm -Force .git/index.lock

# Fazer o primeiro commit
git add -A
git commit -m "Inicial: Site do piloto Luca Dias"

# Adicionar repositório remoto
git remote add origin https://github.com/robertoalcantara/luca_site.git

# Fazer push para main/master
git branch -M main
git push -u origin main
```

### 2. No GitHub

1. Acesse https://github.com/new
2. Nome do repositório: `luca_site`
3. Descrição: "Site oficial do piloto Luca Dias"
4. Marque como **Public** (para ser acessível)
5. Clique em "Create repository"

### 3. Configurar GitHub Pages (opcional)

1. Vá para Settings → Pages
2. Source: Deploy from a branch
3. Branch: main / root
4. Salve e aguarde a construção

O site estará disponível em: `https://robertoalcantara.github.io/luca_site/`

## Estrutura do Repositório

```
luca_site/
├── index.html          # Página principal
├── support.js          # Scripts de suporte
├── README.md           # Documentação
├── .gitignore          # Arquivos ignorados
└── assets/             # Imagens e recursos
    ├── hero-front.jpeg
    ├── action-1.jpeg
    ├── podium-1.jpeg
    └── ... (21 imagens)
```

## Dicas

- Sempre faça commit das mudanças antes de fazer push
- Use mensagens descritivas nos commits
- Mantenha o README.md atualizado com alterações importantes

---

Seu site está pronto! 🎉
