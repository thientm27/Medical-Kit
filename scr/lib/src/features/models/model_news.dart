import 'package:scr/src/constants/images.dart';

class News{
  final String image;
  final String title;
  final String date;
  final String detail;

  News({
    required this.image,
    required this.title,
    required this.date,
    required this.detail,
  });
}

List<News> newsList=[
  News(
    title: 'The Covid-19 Pandemic',
    image: news1,
    date: 'October 3rd, 2023',
    detail: 'With the acute phase of the Covid-19 pandemic fading even as the coronavirus persists and evolves, a new normal is taking shape around the world.'
  ),
  News(
    title: 'What to know about the Blue Zone diet and other healthy habits for longevity',
    image: news2,
    date: 'October 3rd, 2023',
    detail: 'The question of how to live a long, healthy life is increasingly at the forefront of medical research. While centuries ago some may have turned to finding mythical immortality-granting items like the Holy Grail, scientists now say that achieving longevity may rely on eating the right foods, adopting healthy habits, and remaining socially active.'
  ),
  News(
    title: 'Saturated fats vs. omega-3s: Could DHA help protect the brain?',
    image: news3,
    date: 'October 3rd, 2023',
    detail: 'While fat is an essential component of diet, consuming too much saturated fat can contribute to various health problems. Previous research has indicated that high fat diets may contribute to memory deficits. A recent study examined how the saturated fat palmitate influences certain brain cells and the protective factors of the omega-3 fatty acid docosahexaenoic acid. Results indicate that docosahexaenoic acid (DHA) may help to mitigate some of the brain cell damage associated with a high fat diet.'
  ),
  News(
    title: 'Ozempic, Wegovy improve blood sugar levels and weight loss in type 2 diabetes study',
    image: news4,
    date: 'October 3rd, 2023',
    detail: 'There are so many newer medications available to not only lower blood sugar, but also do important things like protect the kidneys and protect the heart. There’s a lot of good therapies out there to give people hope because, as we know, poorly-controlled diabetes is associated with a number of long-term complications,” said Kane. “So it’s really important for patients to get a good handle on their blood sugar, and we have a multitude of medications that can help get them there now.'
  )
];