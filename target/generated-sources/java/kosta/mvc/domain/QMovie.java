package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QMovie is a Querydsl query type for Movie
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMovie extends EntityPathBase<Movie> {

    private static final long serialVersionUID = -25911188L;

    public static final QMovie movie = new QMovie("movie");

    public final StringPath movieCode = createString("movieCode");

    public final DateTimePath<java.util.Date> movieEnddate = createDateTime("movieEnddate", java.util.Date.class);

    public final StringPath movieGenre = createString("movieGenre");

    public final StringPath movieImage = createString("movieImage");

    public final DateTimePath<java.util.Date> movieInsertdate = createDateTime("movieInsertdate", java.util.Date.class);

    public final StringPath movieName = createString("movieName");

    public final NumberPath<Integer> movieRated = createNumber("movieRated", Integer.class);

    public final NumberPath<Integer> movieRunningtime = createNumber("movieRunningtime", Integer.class);

    public final DateTimePath<java.util.Date> movieStartdate = createDateTime("movieStartdate", java.util.Date.class);

    public final StringPath movieSummary = createString("movieSummary");

    public QMovie(String variable) {
        super(Movie.class, forVariable(variable));
    }

    public QMovie(Path<? extends Movie> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMovie(PathMetadata metadata) {
        super(Movie.class, metadata);
    }

}

