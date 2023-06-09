import React, { useEffect, useState } from "react";
import Carousel from "react-multi-carousel";
import "react-multi-carousel/lib/styles.css";
import "./UserSlider.css";
import 'bootstrap/dist/css/bootstrap.min.css';


// Configuración de cuántos elementos mostrar por página del slider en función del tamaño de la pantalla

export default function UserSlider() {
  const [locales, setLocales] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:3000/locales`)
    .then(res => res.json())
    .then((res) => setLocales(res))
    .catch(err => console.log(err));  
  }, []);


  return (
    <div>
      {locales &&
      locales.map((local, index) => {
        if (local.ID === 15) {
          return (
            <div key={index} className="card">
              <img src={local.Portada} alt="" />
                <div className="overlay">
                  <p className="local-name">{local.Nombre}</p>
              </div>
            </div>
          );
        }
        return null; // Si el ID no coincide, no se renderiza nada
      })}
      <br></br>
      {/* Componente principal, en el se pueden establecer las distintas configuraciones que desees, estas configuracion son las necesarias para un Slider sencillo */}
      <Carousel
        additionalTransfrom={0}
        arrows={false}
        centerMode={false}
        className=""
        containerClass="container-padding-bottom"
        draggable
        focusOnSelect
        infinite
        itemClass=""
        keyBoardControl
        minimumTouchDrag={80}
        pauseOnHover
        renderArrowsWhenDisabled={false}
        renderButtonGroupOutside={false}
        renderDotsOutside={false}
        responsive={
          {
            desktop: {
              breakpoint: {
                max: 3000, min: 1024
              },
              items: 4,
              partialVisibilityGutter: 40
            },
            mobile: {
              breakpoint: {
                max: 550, min: 225
              },
              items: 3,
              partialVisibilityGutter: 10
            },
            tablet: {
              breakpoint: {
                max: 1024,
                min: 464
              },
              items: 4,
              partialVisibilityGutter: 30
            }
          }
        }
        rewind={false}
        rewindWithAnimation={false}
        rtl={false}
        sliderClass=""
        slidesToSlide={1}
        swipeable
        >
        {/* Del contenido leído desde el API de jsonplaceholder.com renderizamos el nombre de los usuarios, solo con la finalidad de notar la diferencia al desplazar el slider. */}
        {locales &&
          locales.map((Local, index) => (
            <div key={index} className="card">
              <img src={Local.Portada}
                alt=""
              />
              {/* Pretende ser la imagen de perfil del usuario, esta URL genera una imagen random */}
              <div className="content">
                <p>
                  {Local.Nombre}
                  {Local.Calificacion}
                </p>
              </div>
            </div>
          ))}
      </Carousel>

    </div>
  );
}
