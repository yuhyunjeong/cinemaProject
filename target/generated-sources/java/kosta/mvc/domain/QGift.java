package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QGift is a Querydsl query type for Gift
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QGift extends EntityPathBase<Gift> {

    private static final long serialVersionUID = 1107357812L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QGift gift = new QGift("gift");

    public final StringPath giftCode = createString("giftCode");

    public final StringPath giftName = createString("giftName");

    public final NumberPath<Integer> giftQty = createNumber("giftQty", Integer.class);

    public final QMovie movie;

    public QGift(String variable) {
        this(Gift.class, forVariable(variable), INITS);
    }

    public QGift(Path<? extends Gift> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QGift(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QGift(PathMetadata metadata, PathInits inits) {
        this(Gift.class, metadata, inits);
    }

    public QGift(Class<? extends Gift> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.movie = inits.isInitialized("movie") ? new QMovie(forProperty("movie"), inits.get("movie")) : null;
    }

}

