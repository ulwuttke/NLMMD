# Übungsbeispiel 3 Dehnungsenergiefunktion

## Vorabbemerkungen
Beispiel für die Her leitung der Beziehung zwischen den (Haupt-)Spannungen und den (Haupt-)Streckungen auf Basis der Dehnungsenergiefunktion

## Grundlagen
Aufteilung des Spannungstensors in einen hydrostatischen ($\sigma_m\cdot\delta_{ik}$) und deviatorischen ($s_{ik}$) Anteil

$\sigma_{ik}=\frac{1}{3}\sigma_{ll}\cdot\delta_{ik}+s_{ik}=\sigma_m\cdot\delta_{ik}+s_{ik}$

Aufteilung des Deformationsgradienten in einen volumetrischen (beschreibt die Volumenänderung) und einen isochoren (beschreibt den Vorformungsanteil bei konstantem Volumen) Anteil 

$\boldsymbol{F}=\boldsymbol{F}^{vol}\cdot \boldsymbol{F}^{iso}$

Die Volumenänderung ergibt sich über die Determinante des Deformationsgradienten. Für ein konstantes Volumen gilt $det(\boldsymbol{F})=J=1$. Somit ergibt sich für die Aufteilung

$det(\boldsymbol{F})=J; det(\boldsymbol{F}^{iso})=J^{iso}=1; det(\boldsymbol{F}^{vol})=J^{vol}=J$

Der Deformationsgradient, angegeben **im Hauptsystem** mit $\lambda_i$ den Hauptstreckungen, lässt sich die Aufteilung wie folgt schreiben

$\boldsymbol{F}^{HS}=\begin{bmatrix}
\lambda_1&0&0\\
0&\lambda_2&0\\
0&0&\lambda_3\\
\end{bmatrix}$

$\boldsymbol{F}^{vol HS}=J^{\frac{1}{3}}\cdot\delta_{ik}=\begin{bmatrix}
J^{\frac{1}{3}}&0&0\\
0&J^{\frac{1}{3}}&0\\
0&0&J^{\frac{1}{3}}\\
\end{bmatrix}$
$\text{, mit } J=det(\boldsymbol{F}^{HS})=\lambda_1 \lambda_2 \lambda_3$

$\boldsymbol{F}^{iso HS}=J^{-\frac{1}{3}}\cdot F_{ik}=\begin{bmatrix}
\lambda_1/J^{\frac{1}{3}}&0&0\\
0&\lambda_2/J^{\frac{1}{3}}&0\\
0&0&\lambda_3/J^{\frac{1}{3}}\\
\end{bmatrix} $
$= \begin{bmatrix}
\bar{\lambda}_1&0&0\\
0&\bar{\lambda}_2&0\\
0&0&\bar{\lambda}_3\\
\end{bmatrix}$
$\text{, mit } \bar{\lambda}_i=\frac{\lambda_i}{J^{\frac{1}{3}}}= \frac{\lambda_i}{(\lambda_1 \lambda_2 \lambda_3)^{\frac{1}{3}}}$

Für elastisches Materialverhalten (reversible Verformung) und der Annahme eines elastischen Potentials ergibt sich der [Cauchy]scher Spannugnstensor aus der Dehnungsenergeifunktion $U=w$ und dem Cauchy-Green'schen Verzerrungstensor $\boldsymbol{C}=C_{jk}$

$\sigma_{im}=\frac{2}{J}F_{ij}F_{mk}\frac{\partial w}{\partial C_{jk}}$

hieraus folgt die Formulierung für die Berechnug der Hauptspannungen auf Basis der Hauptstreckungen

$\sigma_{\tilde{i}}=\frac{\lambda_{\tilde{i}}}{J}\frac{\partial w}{\partial \lambda_{\tilde{i}}}$

Für die Umrechnung zwischen dem Cauchy'schen Spannungstensor $\boldsymbol{\sigma}$ und dem 1. Piola-Kirschhoff'schen Spannungstensor $\boldsymbol{P}$ gilt:

$\boldsymbol{P}=P_{lk}=J F^{-1}_{li}\cdot \sigma_{ik}$

oder für die Forkmulierung in Hauptspannungen:

$P_{\tilde{i}}=J\frac{1}{\lambda_{\tilde{i}}}\cdot \sigma_{\tilde{i}}$


## Beispiel

### Dehnungsenergiefunktion
Gegeben ist die Dehnungsenergiefunktion $w$, gegeben in getrennten Anteilen für den isochoren und volumetrischen Anteil

$w=w^{iso}+w^{vol}$

$w^{iso}=\frac{\mu}{\alpha}\cdot(\bar{\lambda}^\alpha_1+\bar{\lambda}^\alpha_2+\bar{\lambda}^\alpha_3-3)$

$w^{vol}=\frac{K}{2}\cdot(J-1)^2$

### isochorer Anteil

Die Ableitung erfolgt nach $\lambda$ und nicht nach $\bar{\lambda}$. Daher folgt zunächst z.B. für die Ableitung nach $\lambda_1$:

$\frac{\partial w^{iso}}{\partial \lambda_\tilde{i}}=
\frac{\partial w^{iso}}{\partial \bar{\lambda_{1}}}\frac{\partial \bar{\lambda_{1}}}{\partial \lambda_{1}} +
\frac{\partial w^{iso}}{\partial \bar{\lambda_{2}}}\frac{\partial \bar{\lambda_{2}}}{\partial \lambda_{1}} +
\frac{\partial w^{iso}}{\partial \bar{\lambda_{3}}}\frac{\partial \bar{\lambda_{3}}}{\partial \lambda_{1}}
$

mit den Ableitungen

$\frac{\partial w^{iso}}{\partial \bar{\lambda_{1}}}=\mu \bar{\lambda_1}^{\alpha_1-1} \text{ ; }
\frac{\partial w^{iso}}{\partial \bar{\lambda_{2}}}=\mu \bar{\lambda_2}^{\alpha_1-1} \text{ ; }
\frac{\partial w^{iso}}{\partial \bar{\lambda_{3}}}=\mu \bar{\lambda_3}^{\alpha_1-1}$

$\frac{\partial \bar{\lambda_{1}}}{\partial \lambda_{1}}=
\frac{\partial}{\partial \lambda_{1}} \left[\frac{\lambda_1}{(\lambda_1 \lambda_2 \lambda_3)^{\frac{1}{3}}}\right]=
\frac{2}{3}\lambda_1^{-1/3}\lambda_2^{-1/3}\lambda_3^{-1/3}=
\frac{2}{3}J^{-1/3}=
\frac{2}{3}\frac{\bar{\lambda_{1}}}{\lambda_{1}}$

$\frac{\partial \bar{\lambda_{2}}}{\partial \lambda_{1}}=
\frac{\partial}{\partial \lambda_{1}} \left[\frac{\lambda_2}{(\lambda_1 \lambda_2 \lambda_3)^{\frac{1}{3}}}\right]=
-\frac{1}{3}\lambda_1^{-4/3}\lambda_2^{2/3}\lambda_3^{-1/3}=
-\frac{1}{3}\frac{\lambda_{2}}{\lambda_{1}}J^{-1/3}=
-\frac{1}{3}\frac{\bar{\lambda_{2}}}{\lambda_{1}}$

$\frac{\partial \bar{\lambda_{3}}}{\partial \lambda_{1}}=
\frac{\partial}{\partial \lambda_{1}} \left[\frac{\lambda_3}{(\lambda_1 \lambda_2 \lambda_3)^{\frac{1}{3}}}\right]=
-\frac{1}{3}\lambda_1^{-4/3}\lambda_2^{-1/3}\lambda_3^{2/3}=
-\frac{1}{3}\frac{\lambda_{3}}{\lambda_{1}}J^{-1/3}=
-\frac{1}{3}\frac{\bar{\lambda_{3}}}{\lambda_{1}}$

Da der hydrostatische Anteil des Spannungstensors bei isochorer Verformung keinen Anteil an der Dehnungsenergie hat, ergeben sich auch nur deviatorische Anteile. Für die Hauptspannugnen des Deviators gilt:

$\sigma^{iso}_{\tilde{i}}=s_{\tilde{i}}=\frac{\lambda_{\tilde{i}}}{J}\frac{\partial w^{iso}}{\lambda_{\tilde{i}}}$

und nach EInsetzen der Ableitungen der hier gegebenen Dehugnsenergiefunktion

$s_{1}=\frac{\mu}{J} \left[\frac{2}{3} \bar{\lambda}^\alpha_1 - \frac{1}{3} \bar{\lambda}^\alpha_2 - \frac{1}{3} \bar{\lambda}^\alpha_3 \right]$

$s_{2}=\frac{\mu}{J} \left[\frac{2}{3} \bar{\lambda}^\alpha_2 - \frac{1}{3} \bar{\lambda}^\alpha_1 - \frac{1}{3} \bar{\lambda}^\alpha_3 \right]$

$s_{3}=\frac{\mu}{J} \left[\frac{2}{3} \bar{\lambda}^\alpha_3 - \frac{1}{3} \bar{\lambda}^\alpha_1 - \frac{1}{3} \bar{\lambda}^\alpha_2 \right]$

(Spätestens jetzt ist auch zu erkennen, dass dis sich ergebenden Spannungen "Mittelspannungsfrei" sind, also $s_1+s_2+s_3=0$.)


### volumetreischer Anteil

Aus der Dehnungsenergiefunktion für den volumetrischen anteil ist nur der hydrostatische Spannugnszustand verantwortlich. Damit gilt (das kann gerne einmal für die verschiedenen Spannuungen gerechnet werden):

$\sigma_m=\sigma_1^{vol}=\sigma_2^{vol}=\sigma_3^{vol}$

Damit ergibt sich z.B. für $\sigma_1^{vol}$:

$\sigma_{1}^{vol}=\frac{\lambda_{1}}{J}\frac{\partial w^{vol}}{\partial\lambda_{1}} =
\frac{\lambda_{1}}{J}\frac{\partial w^{vol}}{\partial J}\frac{\partial J}{\partial \lambda_1}=$$
\frac{\lambda_{1}}{J}\frac{\partial }{\partial J}\left[ \frac{K}{2}\cdot(J-1)^2 \right]\frac{\partial }{\partial \lambda_1}\left[ \lambda_1 \lambda_2 \lambda_3 \right]=$$
\frac{\lambda_{1}}{J} \left[ K \cdot(J-1) \right] \left[ \lambda_2 \lambda_3 \right]=
K \cdot(J-1)$


### "Zusammenbau"

Es ergibt sich insgesamt:

$\sigma_1=\frac{\mu}{J} \left[\frac{2}{3} \bar{\lambda}^\alpha_1 - \frac{1}{3} \bar{\lambda}^\alpha_2 - \frac{1}{3} \bar{\lambda}^\alpha_3 \right]+K \cdot(J-1)$

bzw. 

$P_1=\frac{\mu}{\lambda_1} \left[\frac{2}{3} \bar{\lambda}^\alpha_1 - \frac{1}{3} \bar{\lambda}^\alpha_2 - \frac{1}{3} \bar{\lambda}^\alpha_3 \right]+ \frac{J}{\lambda_1}K \cdot(J-1)$

Die anderen Spannungskomponeten ergeben sich analog. Damti gilt für den Spannungstensor:

$\boldsymbol{\sigma}=\sigma_{ik}=\begin{bmatrix}
\sigma_1&0&0\\
0&\sigma_2&0\\
0&0&\sigma_3\\
\end{bmatrix}$

$\boldsymbol{P}=P_{ik}=\begin{bmatrix}
P_1&0&0\\
0&P_2&0\\
0&0&P_3\\
\end{bmatrix}$

