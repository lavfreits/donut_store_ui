# Donut Store UI

O Donut Store UI é um aplicativo de exemplo que apresenta uma interface de usuário simples para uma loja de donuts. Este projeto foi desenvolvido em Flutter e usa a biblioteca Provider para gerenciar o estado e Firebase Cloud Firestore para armazenar dados como items favoritados.

## Capturas de Tela
![Donut Store UI](https://raw.githubusercontent.com/lavfreits/donut_store_ui/master/screen_recording.gif)


## Recursos

- Exibição de donuts, hambúrgueres e smoothies em guias separadas.
- Adição de itens ao carrinho de compras.
- Funcionalidade de favoritar para itens.
- Salvamento dos favoritos foi feito no Firestore.
- Remoção de itens do carrinho de compras e dos favoritos.
- Products List page é uma página exemplo de como poderíamos implementar para adicionar mais produtos na loja que também salva no Firestore.


## Dependências

Este projeto depende das seguintes bibliotecas Flutter:

- [Provider](https://pub.dev/packages/provider): Usado para injeção de dependência.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore): Usado para integrar o Firestore para salvar e buscar os favoritos e itens.
- [firebase_core](https://pub.dev/packages/firebase_core): Necessário para a inicialização do Firebase.
- [uuid](https://pub.dev/packages/uuid): Usado para gerar identificadores únicos.
- [MobX](https://pub.dev/packages/mobx): Usado para gerenciar o estado do carrinho de compras e itens favoritados.
- [flutter_mobx](https://pub.dev/packages/flutter_mobx): Integração do MobX com Flutter.
- [build_runner](https://pub.dev/packages/build_runner): Usado para a geração de código do MobX.
- [mobx_codegen](https://pub.dev/packages/mobx_codegen): Usado para a geração de código do MobX.

Certifique-se de adicionar essas dependências ao arquivo `pubspec.yaml` do seu projeto.

## Como Usar

Para usar este projeto, siga estas etapas:

1. Clone este repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Configure o Firebase no seu projeto e adicione as credenciais ao seu arquivo `google-services.json` ou `Info.plist`.
4. Execute o aplicativo em seu emulador ou dispositivo.

## Branch Alternativa
Há uma branch alternativa chamada managing_with_mobx que utiliza MobX para gerenciamento de estado e Provider para injeção de dependência.. Para usar essa versão, faça o checkout da branch managing_with_mobx:

```bash
git checkout managing_with_mobx
```

