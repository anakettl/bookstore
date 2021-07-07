import React from "react";
import { Link } from "react-router-dom";

import landingImg from '../../assets/images/books11.jpeg'

function Landing() {
  return (
    <div id="page-landing">
      <div id="page-landing-content" className="container">
        <div id="logo-container">
          <h1>Livraria</h1>
          <h2>A sua livraria online</h2>
        </div>

        <img
          src={landingImg}
          className="hero-image"
          alt="livros"
        />

        <div className="buttons-container">
          <Link to="/products" className="study">
            Ver produtos
          </Link>
        </div>
        <span className="phrase-container">
          A leitura é o caminho do conhecimento
        </span>
      </div>
    </div>
  )
}

export default Landing;