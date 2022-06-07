package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTime is a Querydsl query type for Time
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QTime extends EntityPathBase<Time> {

    private static final long serialVersionUID = 1107745297L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTime time = new QTime("time");

    public final QMovie movie;

    public final QScreen screen;

    public final NumberPath<Long> timeCode = createNumber("timeCode", Long.class);

    public final DateTimePath<java.util.Date> timeDate = createDateTime("timeDate", java.util.Date.class);

    public final DateTimePath<java.util.Date> timeEnd = createDateTime("timeEnd", java.util.Date.class);

    public final DateTimePath<java.util.Date> timeStart = createDateTime("timeStart", java.util.Date.class);

    public QTime(String variable) {
        this(Time.class, forVariable(variable), INITS);
    }

    public QTime(Path<? extends Time> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTime(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTime(PathMetadata metadata, PathInits inits) {
        this(Time.class, metadata, inits);
    }

    public QTime(Class<? extends Time> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.movie = inits.isInitialized("movie") ? new QMovie(forProperty("movie"), inits.get("movie")) : null;
        this.screen = inits.isInitialized("screen") ? new QScreen(forProperty("screen")) : null;
    }

}

