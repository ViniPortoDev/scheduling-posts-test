# Instagram Post Scheduler

Aplicativo Flutter para agendamento de postagens no Instagram desenvolvido como desafio técnico.

## 📱 Funcionalidades

- **Agendamento de Postagens**: Permite selecionar uma data e adicionar título e descrição para postagens
- **Visualização por Data**: Exibe todas as postagens agendadas para a data selecionada
- **Persistência Local**: Mantém os dados salvos entre reinicializações do app
- **Interface Responsiva**: Adapta-se a diferentes tamanhos de tela (smartphone e tablet)
- **UI/UX Intuitiva**: Interface simples e funcional com tema inspirado no Instagram

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (>=3.1.3)
- Dart SDK
- Android Studio ou VS Code
- Emulador/dispositivo Android ou iOS

### Instalação

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITORIO]
cd instagram_scheduler
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o aplicativo:
```bash
flutter run
```

## 🏗️ Arquitetura e Implementação

### Estrutura do Código

O aplicativo foi desenvolvido seguindo boas práticas de Flutter:

- **main.dart**: Arquivo principal contendo toda a lógica da aplicação
- **Classe Post**: Model para representar as postagens agendadas
- **SchedulerHomePage**: Widget principal que gerencia o estado da aplicação
- **Componentes modulares**: Métodos separados para construir diferentes partes da UI

### Funcionalidades Implementadas

#### 1. Tela de Agendamento
- Seletor de data com DatePicker personalizado
- Campos de entrada para título (max 100 caracteres) e descrição (max 500 caracteres)
- Botão "Agendar Postagem" com validação de campos obrigatórios
- Feedback visual com SnackBars para sucesso/erro

#### 2. Exibição das Postagens Agendadas
- Lista dinâmica filtrada por data selecionada
- Cards com título, descrição e opção de exclusão
- Estado vazio com ilustração quando não há postagens
- Numeração sequencial das postagens

#### 3. Persistência Local de Dados
- Utilização do `shared_preferences` para salvar dados localmente
- Serialização/deserialização JSON para objetos Post
- Carregamento automático dos dados ao iniciar o app

#### 4. Responsividade
- Layout adaptativo usando `LayoutBuilder`
- **Smartphone**: Layout vertical com scroll
- **Tablet/Desktop**: Layout horizontal com duas colunas
- Componentes se ajustam automaticamente ao tamanho da tela

#### 5. UI/UX
- Tema personalizado com cores do Instagram (#E4405F)
- Cards com elevação e bordas arredondadas
- Ícones intuitivos e feedback visual
- Confirmação antes de excluir postagens

### Gerenciamento de Estado

Utilizou-se o `setState` nativo do Flutter para simplicidade, conforme solicitado:
- Estado local para lista de postagens
- Filtros reativos baseados na data selecionada
- Controladores de texto para os campos de entrada

### Dependências

- **shared_preferences**: Persistência local de dados
- **cupertino_icons**: Ícones do iOS

## 📱 Screenshots e Fluxo

### Fluxo Principal:
1. Usuário seleciona uma data
2. Preenche título e descrição
3. Clica em "Agendar Postagem"
4. Postagem aparece na lista da data selecionada
5. Dados são salvos localmente

### Funcionalidades Extras:
- Exclusão de postagens com confirmação
- Validação de campos obrigatórios
- Feedback visual para ações do usuário
- Interface adaptativa para diferentes dispositivos

## 🔧 Melhorias Futuras

Possíveis melhorias que poderiam ser implementadas:

- Edição de postagens agendadas
- Visualização em calendário
- Categorização de postagens
- Exportação/importação de dados
- Notificações locais para lembrar das postagens
- Suporte a imagens/mídia
- Integração real com API do Instagram

## 📝 Notas Técnicas

- Código organizado e modularizado
- Tratamento de erros adequado
- Interface responsiva testada em diferentes tamanhos
- Uso de boas práticas do Flutter
- Comentários no código para facilitar manutenção
- Estrutura preparada para expansão futura

## 🎯 Requisitos Atendidos

✅ Tela de agendamento com seleção de data, título e descrição  
✅ Exibição de postagens agendadas por data  
✅ Persistência local de dados  
✅ Interface responsiva (smartphone e tablet)  
✅ UI/UX simples e intuitiva  
✅ Gerenciamento de estado com setState  
✅ Código organizado e com boas práticas  
✅ README com instruções completas  

---

**Desenvolvido como desafio técnico para posição de desenvolvedor Flutter**