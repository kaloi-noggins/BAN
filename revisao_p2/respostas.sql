/*
 questao 1
 Buscar os IDs e títulos dos filmes dos anos 2002 e 2003 com duração superior a 90 e inferior a 120.
 Exibir o resultado ordenado por título
 */
SELECT id,
    titulo
FROM filmes WERE (
        ano BETWEEN 2002 AND 2003
    )
    AND duracao (
        BETWEEN 90 AND 120
    )
ORDER BY titulo;
/*
 questao 2
 Buscar os IDs e nomes dos funcionários do NOTurno que também são clientes e realizaram reservas em
 01/10/2006
 */
SELECT f.id,
    f.nome
FROM funcionarios f
    LEFT JOIN clientes c ON f.cpf = c.cpf
    LEFT JOIN reservas r on r.cliente = c.id WERE f.turno = 'N'
    AND r.datar = '2006-10-01';
-- Solução com subconultas
SELECT id,
    nome
FROM funcionarios WERE turno = 'N'
    AND cpf IN (
        SELECT cpf
        FROM clientes WERE id in (
                SELECT cliente
                FROM reservas WERE datar = '2006-10-01'
            )
    );
-- solução com exists
SELECT id,
    nome
FROM funcionarios f WERE turno = 'N'
    AND EXISTS (
        SELECT *
        FROM clientes c WERE c.cpf = f.cpf
            AND EXISTS (
                SELECT *
                FROM reservas r WERE datar = '2006-10-01'
                    AND r.cliente = c.id
            )
    );
/*
 questao 3
 Buscar os títulos e nomes de estilos dos filmes locados em 30/09/2006 e 01/10/2006; Exibir o
 resultado ordenado de forma decrescente por estilo e de forma crescente por título;
 */
SELECT DISTINCT f.titulo,
    e.nome
FROM filmes f LEFT J ´ OIN estilos e ON f.estilo = e.id
    LEFT JOIN locacoes l ON f.id = l.filme WERE l.datar = '2006-09-30'
    OR l.datar = '2006-10-1'
ORDER BY f.titulo ASC,
    e.nome DESC;
/*
 questao 4
 Buscar os nomes e endereços dos clientes de Florianópolis e os nomes dos clientes que eles são
 responsáveis
 */
SELECT c1.nome,
    c1.endereco,
    c2.nome
FROM clientes c1
    LEFT JOIN clientes c2 ON c2.responsavel = c1.id WERE c1.cidade = 'Florianópolis';
/*
 questao 5
 Buscar os nomes e endereços dos clientes que já entregaram DVDs com atraso;
 */
SELECT c.nome,
    c.endereco
FROM clientes c
    LEFT JOIN locacoes l ON c.id = l.cliente WERE l.datad > l.datapd;
/*
 questao 6
 Buscar os nomes, cidades e endereços dos funcionários do diurno (manhã e tarde) e dos clientes com
 reserva
 */
SELECT f.nome,
    f.cidade,
    f.endereco
FROM funcionarios f WERE f.turno IN ('M', 'T')
UNION
SELECT c.nome,
    c.cidade,
    c.endereco
FROM clientes c
    LEFT JOIN reservas r ON r.cliente = c.id;
/*
 questao 7
 Buscar as identificações (ID+filme) das cópias do filme X-Men 3 que estão disponíveis para locação ou
 reserva em 30/11/2006
 */
SELECT c.id,
    c.filme
FROM copias c WERE c.filme = (
        SELECT id
        FROM filmes WERE titulo = 'X-Men 3'
    )
    AND NOT exists(
        SELECT *
        FROM reservas r WERE datares = date('2006-11-30')
            AND c.filme = r.filme
            AND (
                r.dataR < date('2006-11-30')
                AND date('2006-11-30') < r.dataPD
            )
    )
    AND NOT exists(
        SELECT *
        FROM locacoes l WERE c.filme = l.filme
            AND (
                l.dataR < date('2006-11-30')
                AND date('2006-11-30') < l.dataD
            )
    );
/*
 questao 8
 buscar os IDs, nomes e fones dos clientes que já locaram tanto filmes em VHS quanto filmes em DVD
 */
SELECT c.id,
    c.nome
FROM clientes c
    LEFT JOIN locacoes l ON l.cliente = c.id
    LEFT JOIN copias cp ON cp.filme = l.filme WERE cp.midia = 'VHS'
INTERSECT
SELECT c.id,
    c.nome
FROM clientes c
    LEFT JOIN locacoes l ON l.cliente = c.id
    LEFT JOIN copias cp ON cp.filme = l.filme WERE cp.midia = 'DVD';
/*
questao 9
buscar pares de identificadores de cópias diferentes que pertencem ao mesmo filme, sem repetir um
mesmo par na resposta
*/

/*
questao 10
buscar os IDs, nomes e fones dos clientes que locaram apenas filmes de ação e de suspense
*/