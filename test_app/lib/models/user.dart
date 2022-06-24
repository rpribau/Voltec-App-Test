class UserFields {
  static final String numteam = 'Num. de equipo';
  static final String nameteam = 'Nombre del equipo';
  static final String nummatch = 'Num. de juego';
  static final String matchtype = 'Tipo de juego';
  static final String alliance = 'Alianza';
  static final String tarmacauto = 'Dejo el tarmac?';
  static final String lowerauto = 'Puntos en Lower Hub (Auto)';
  static final String upperauto = 'Puntos en Upper Hub (Auto)';
  static final String lowerteleop = 'Puntos en Lower Hub (Teleop)';
  static final String upperteleop = 'Puntos en Upper Hub (Teleop)';
  static final String defended = 'El robot defendio?';
  static final String gotdefended = 'Defendieron el robot?';
  static final String rung = 'Escalo?';
  static final String fouls = 'Numero de fouls';
  static final String techfouls = 'Numero de tech fouls';
  static final String allianceresult = 'Resultado de la alianza';
  static final String rp = 'Num. de RP';
  static final String won = 'Gano?';
  static final String comments = 'Comentarios:';

  static List<String> getFields() => [
        numteam,
        nameteam,
        nummatch,
        matchtype,
        alliance,
        tarmacauto,
        lowerauto,
        upperauto,
        lowerteleop,
        upperteleop,
        defended,
        gotdefended,
        rung,
        fouls,
        techfouls,
        allianceresult,
        rp,
        won,
        comments
      ];
}
