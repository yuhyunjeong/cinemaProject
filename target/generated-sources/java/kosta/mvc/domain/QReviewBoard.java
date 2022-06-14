package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QReviewBoard is a Querydsl query type for ReviewBoard
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QReviewBoard extends EntityPathBase<ReviewBoard> {

    private static final long serialVersionUID = -1172479318L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QReviewBoard reviewBoard = new QReviewBoard("reviewBoard");

    public final StringPath content = createString("content");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final QMember member;

    public final QMovie movie;

    public final NumberPath<Long> reviewCode = createNumber("reviewCode", Long.class);

    public final NumberPath<Long> sratRating = createNumber("sratRating", Long.class);

    public QReviewBoard(String variable) {
        this(ReviewBoard.class, forVariable(variable), INITS);
    }

    public QReviewBoard(Path<? extends ReviewBoard> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QReviewBoard(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QReviewBoard(PathMetadata metadata, PathInits inits) {
        this(ReviewBoard.class, metadata, inits);
    }

    public QReviewBoard(Class<? extends ReviewBoard> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.member = inits.isInitialized("member") ? new QMember(forProperty("member")) : null;
        this.movie = inits.isInitialized("movie") ? new QMovie(forProperty("movie"), inits.get("movie")) : null;
    }

}

