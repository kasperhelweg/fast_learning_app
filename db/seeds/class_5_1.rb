# encoding: utf-8

classroom_1 = Classroom.find(1)

classroom_1.pages.build(title: "Forside",
                            glyph: "icon-download",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Guide til det virtuelle læringsrum</h4>
    <p>
      Kurset sætter fokus på dit personlige lederskab i situationen for den svære samtale. Vi vil arbejde på at give dig konkrete teknikker til at gribe den svære samtale an ud fra en løsningsfokuseret tilgang. I Helweg & Pedersen tror vi på, at den løsningsfokuserede tilgang til samtalen giver det bedste resultat, for dig som leder. Metoden er fremadrettet og fokuserer på, at du får skabt løsninger i samspil med din medarbejder. 
    </p>
    <p>
      Du vil her få en introduktion til, hvordan du skal arbejde med det virtuelle læringsrum for den svære samtale. For at du får mest muligt ud af kurset, anbefaler vi, at du følger vores guide:</p>
  </div>

<div class="clear"></div>

  <div class="span8">
    <h4>Introduktion til kurset</h4>
    <p>Her vil du blive præsenteret for baggrunden for kurset og hvorfor vi i Helweg & Pedersen ser temaet som relevant for dig som leder. Du vil stifte bekendtskab med nogle eksempler på den svære samtale – og samtidig også få en mere nuanceret forståelse for, hvornår en samtale kan siges at være svær.</p>
  </div>
  <div class="span4"><img alt="Convert-html" height="226" src="/assets/convert-html.png" width="285" /></div>
  
  <div class="span4"><img alt="Thumbnail-files" height="226" src="/assets/thumbnail-files.png" width="285" /></div>
  <div class="span8">
    <h4>Forberedelse</h4>
    <p>Når du har sat dig ind i baggrunden for den svære samtale, er næste skridt din forberedelse. Forberedelsen har til formål at klæde dig bedst muligt på til kursusdagen, hvor din tilgang til den svære samtale vil blive sat i spil.
    </p>
  </div>
</div>
'
                           )
classroom_1.pages.build(title: "Introduktion", 
                            glyph: "icon-globe",
                            content: '
<div class="row content-classroom">
 <div class="span9"> 
<h4>Den svære samtale</h4>
<p>Lær at håndtere en vanskelig samtale, ved at fokusere på løsninger.</p>
<a href="https://s3.amazonaws.com/2ee49c5a83c63507e858d59c850ac4e0fb9d89d4214fcc4744a23fe213412454/resources/resources/000/000/001/original/dss.pdf" class="btn btn-large btn-primary"><i class="icon-circle-arrow-down icon-white dglyph"></i>Download .PDF</a>
</div>
</div>
'
                            )

classroom_1.pages.build(title: "Forberedelse",  
                            glyph: "icon-leaf",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Forberedelse</h4>
  </div>
</div>
'
                            )

classroom_1.pages.build(title: "Kursusdagen",  
                            glyph: "icon-heart",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Kursusdagen</h4>
  </div>
</div>
'
                            )
classroom_1.pages.build(title: "Opfølgning",  
                            glyph: "icon-bell",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Opfølgning</h4>
  </div>
</div>
'
                            )
classroom_1.pages.build(title: "Test",  
                            glyph: "icon-pencil",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Test</h4>
  </div>
</div>
'
                            )
classroom_1.pages.build(title: "Evaluering",  
                            glyph: "icon-tag",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Evaluering</h4>
  </div>
</div>
'
                            )
classroom_1.pages.build(title: "Bibliotek",  
                            glyph: "icon-book",
                            content: '
<div class="row content-classroom">
  <div class="span9"> 
    <h4>Bibliotek</h4>
  </div>
</div>
'
                            )


classroom_1.save
