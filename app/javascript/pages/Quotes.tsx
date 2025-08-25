import { Head } from "@inertiajs/react";
import { useState } from "react";

import cs from "./Quotes.module.css";

type Quote = {
  id: number;
  content: string;
};

type Props = {
  quotes: Quote[];
  random_quote?: Quote;
};

export default function Quotes({ quotes, random_quote }: Props) {
  const [currentQuote, setCurrentQuote] = useState<Quote | undefined>(random_quote);

  const getRandomQuote = () => {
    const rand = quotes[Math.floor(Math.random() * quotes.length)];
    setCurrentQuote(rand);
  };

  return (
    <>
      <Head title="InspireRails - Frases Motivacionais" />

      <div className={cs.root}>
        <h1 className={cs.h1}>✨ InspireRails ✨</h1>

        {currentQuote && (
          <div className={cs.quoteBox}>
            <p className={cs.quote}>"{currentQuote.content}"</p>
          </div>
        )}

        <button className={cs.button} onClick={getRandomQuote}>
          Me inspire
        </button>

        <div className={cs.allQuotes}>
          <h2>Todas as frases</h2>
          <ul>
            {quotes.map((q) => (
              <li key={q.id}>{q.content}</li>
            ))}
          </ul>
        </div>
      </div>
    </>
  );
}
