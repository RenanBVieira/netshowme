import React, { useState } from 'react';
import './Carousel.css';

const Carousel = ({ items }) => {
  // Estado para controlar o índice atual
  const [currentIndex, setCurrentIndex] = useState(0);

  // Função para ir ao próximo item
  const handleNext = () => {
    setCurrentIndex((prevIndex) => (prevIndex + 1) % items.length);
  };

  // Função para ir ao item anterior
  const handlePrev = () => {
    setCurrentIndex((prevIndex) => (prevIndex - 1 + items.length) % items.length);
  };

  return (
    <div className="carousel">
      {/* Wrapper que desliza os itens */}
      <div
        className="carousel-wrapper"
        style={{
          transform: `translateX(-${currentIndex * 100}%)`,
        }}
      >
        {items.map((item, index) => (
          <div className="carousel-item" key={index}>
            <img src={item.image} alt={item.title} />
            <h3>{item.title}</h3>
          </div>
        ))}
      </div>

      {/* Controles de navegação */}
      <button className="carousel-control prev" src="../assets/icons/carousel_1.png" onClick={handlePrev}>
        &#8249;
      </button>
      <button className="carousel-control next" onClick={handleNext}>
        &#8250;
      </button>
    </div>
  );
};

export default Carousel;
