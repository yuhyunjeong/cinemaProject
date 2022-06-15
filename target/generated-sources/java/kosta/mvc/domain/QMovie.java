package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMovie is a Querydsl query type for Movie
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMovie extends EntityPathBase<Movie> {

    private static final long serialVersionUID = -25911188L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QMovie movie = new QMovie("movie");

    public final StringPath actorList = createString("actorList");

    public final QGift gift;

    public final NumberPath<Integer> movieAge = createNumber("movieAge", Integer.class);

    public final StringPath movieCode = createString("movieCode");

    public final DateTimePath<java.util.Date> movieEnddate = createDateTime("movieEnddate", java.util.Date.class);

    public final StringPath movieGenre = createString("movieGenre");

    public final StringPath movieImage = createString("movieImage");

    public final StringPath movieName = createString("movieName");

    public final StringPath moviePath = createString("moviePath");

    public final NumberPath<Integer> movieRunningtime = createNumber("movieRunningtime", Integer.class);

    public final DateTimePath<java.util.Date> movieStartdate = createDateTime("movieStartdate", java.util.Date.class);

    public final StringPath movieSummary = createString("movieSummary");

    public final ListPath<Time, QTime> timeList = this.<Time, QTime>createList("timeList", Time.class, QTime.class, PathInits.DIRECT2);

    public QMovie(String variable) {
        this(Movie.class, forVariable(variable), INITS);
    }

    public QMovie(Path<? extends Movie> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QMovie(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QMovie(PathMetadata metadata, PathInits inits) {
        this(Movie.class, metadata, inits);
    }

    public QMovie(Class<? extends Movie> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.gift = inits.isInitialized("gift") ? new QGift(forProperty("gift"), inits.get("gift")) : null;
    }

}

