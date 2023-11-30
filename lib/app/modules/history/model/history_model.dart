class ChatModel {
  final String title;
  final String subtitle;
  final List<Map<String, String>> messages;

  ChatModel(
      {required this.title, required this.subtitle, required this.messages});
}

List<ChatModel> dummyChatData = [
  ChatModel(
    title: "I weigh 115 kg and I want a diet plan for I get",
    subtitle: '29 Dec 2023 - 09:41 AM',
    messages: [
      {
        "you":
            "Olá, estou buscando um plano de dieta para perder peso. Você pode me ajudar?"
      },
      {
        "bot":
            "Claro, ficarei feliz em ajudar. Podemos começar com algumas informações sobre seus hábitos alimentares atuais?"
      },
      {
        "you":
            "Atualmente, minha dieta consiste principalmente em alimentos processados e fast food."
      },
      {
        "bot":
            "Entendi. Vamos trabalhar juntos para criar um plano de dieta saudável com base em alimentos naturais e equilibrados."
      },
    ],
  ),
  ChatModel(
    title: "Give me a recipe for making Japanese food",
    subtitle: '28 Dec 2023 - 04:35 PM',
    messages: [
      {
        "you":
            "Olá! Estou procurando uma receita de comida japonesa para experimentar em casa. Alguma sugestão?"
      },
      {
        "bot":
            "Claro, você gostaria de preparar sushi, ramen ou outra coisa específica?"
      },
      {"you": "Pode ser sushi! Como faço para fazer sushi em casa?"},
      {
        "bot":
            "Ótimo! Vamos começar com uma receita simples de sushi com arroz, alga nori e peixe de sua escolha."
      },
    ],
  ),
  ChatModel(
    title: "Fitness routine for a beginner",
    subtitle: '27 Dec 2023 - 11:20 AM',
    messages: [
      {
        "you":
            "Oi, estou pensando em começar uma rotina de exercícios para iniciantes. Alguma sugestão?"
      },
      {
        "bot":
            "Certamente! Vamos começar com alguns exercícios cardiovasculares leves, como caminhada ou corrida."
      },
      {
        "you":
            "Isso parece bom. E quanto a exercícios de musculação para iniciantes?"
      },
      {
        "bot":
            "Para iniciantes, recomendo exercícios simples, como agachamentos, flexões e abdominais. Vamos criar uma rotina adequada para você."
      },
    ],
  ),
  ChatModel(
    title: "Learning a new language",
    subtitle: '26 Dec 2023 - 08:15 PM',
    messages: [
      {
        "you":
            "Olá! Estou interessado em aprender um novo idioma. Alguma recomendação para iniciantes?"
      },
      {
        "bot":
            "Sim, é uma ótima ideia! Recomendo começar com aplicativos de idiomas, como Duolingo ou Babbel."
      },
      {
        "you":
            "Parece interessante. Alguma sugestão específica de idioma para começar?"
      },
      {
        "bot":
            "Depende dos seus interesses. Inglês, espanhol e francês são ótimas opções para iniciantes."
      },
    ],
  ),
  ChatModel(
    title: "Planning a trip to Europe",
    subtitle: '25 Dec 2023 - 03:50 PM',
    messages: [
      {
        "you":
            "Oi! Estou planejando uma viagem para a Europa. Alguma recomendação de destinos imperdíveis?"
      },
      {
        "bot":
            "Certamente! Paris, Londres e Barcelona são destinos incríveis com muitas atrações."
      },
      {
        "you":
            "Ótimo! Alguma dica de como planejar uma viagem internacional pela primeira vez?"
      },
      {
        "bot":
            "Certifique-se de verificar os requisitos de visto, reservar acomodações com antecedência e planejar seu itinerário com flexibilidade."
      },
    ],
  ),
  ChatModel(
    title: "Choosing a career path",
    subtitle: '24 Dec 2023 - 10:30 AM',
    messages: [
      {
        "you":
            "Oi, estou em um dilema sobre minha escolha de carreira. Como posso tomar uma decisão informada?"
      },
      {
        "bot":
            "É uma decisão importante. Recomendo avaliar seus interesses, habilidades e metas de longo prazo."
      },
      {
        "you":
            "Estou interessado em muitas áreas. Como escolher a melhor opção para mim?"
      },
      {
        "bot":
            "Converse com profissionais na área, faça estágios e pesquise as oportunidades de carreira em cada campo."
      },
    ],
  ),
  ChatModel(
    title: "Book recommendations for the summer",
    subtitle: '23 Dec 2023 - 05:55 PM',
    messages: [
      {
        "you":
            "Olá! Estou procurando algumas recomendações de livros para ler neste verão. Alguma sugestão?"
      },
      {
        "bot":
            "Claro! Que gênero você prefere? Romance, ficção científica, mistério...?"
      },
      {
        "you":
            "Gosto de ficção científica e mistério. Tem alguma recomendação empolgante?"
      },
      {
        "bot":
            "Recomendo 'Duna' de Frank Herbert para ficção científica e 'A Garota no Trem' de Paula Hawkins para mistério."
      },
    ],
  ),
  ChatModel(
    title: "Home gardening tips",
    subtitle: '22 Dec 2023 - 02:45 PM',
    messages: [
      {
        "you":
            "Oi! Estou interessado em começar uma horta em casa. Alguma dica para um iniciante?"
      },
      {
        "bot":
            "É uma ótima ideia! Comece escolhendo plantas fáceis de cuidar, como manjericão, hortelã e tomate."
      },
      {
        "you":
            "Isso parece bom. Alguma dica sobre como cuidar das plantas adequadamente?"
      },
      {
        "bot":
            "Certifique-se de fornecer água suficiente, luz solar adequada e use um solo de qualidade para suas plantas."
      },
    ],
  ),
  ChatModel(
    title: "Healthy snack ideas",
    subtitle: '21 Dec 2023 - 09:15 AM',
    messages: [
      {
        "you":
            "Oi! Preciso de ideias para lanches saudáveis. Você tem alguma sugestão?"
      },
      {
        "bot":
            "Certamente! Frutas frescas, vegetais cortados, iogurte com granola e nozes são ótimas opções."
      },
      {
        "you":
            "Gostei das sugestões. Alguma receita rápida que eu possa experimentar agora?"
      },
      {
        "bot":
            "Experimente fazer um smoothie de frutas mistas. Bata frutas congeladas com iogurte e mel. Delicioso e saudável!"
      },
    ],
  ),
  ChatModel(
    title: "Home workout routine",
    subtitle: '20 Dec 2023 - 04:20 PM',
    messages: [
      {
        "you":
            "Oi! Estou procurando uma rotina de exercícios em casa. Você tem sugestões para iniciantes?"
      },
      {
        "bot":
            "Certamente! Você pode começar com exercícios cardiovasculares leves, como pular corda e agachamentos."
      },
      {
        "you":
            "Isso parece bom. Alguma sugestão de exercícios para fortalecer os músculos?"
      },
      {
        "bot":
            "Para fortalecimento muscular, tente flexões, pranchas e agachamentos com peso corporal."
      },
    ],
  ),
];
